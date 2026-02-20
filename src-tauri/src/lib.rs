use error_stack::ResultExt;
use std::time::Duration;
use tokio::time::timeout;

mod command {
    use super::*;

    #[tauri::command]
    pub async fn should_app_disable() -> Option<String> {
        let db = match setup_db().await {
            Ok(db) => db,
            Err(report) => {
                println!("{report:?}");

                return Some(
                    "No se pudo conectar a la base de datos. Por favor \
                    asegurese que tenga internet."
                        .into(),
                );
            }
        };

        match check_should_disable(&db).await {
            Ok(None) => None,
            Ok(Some(reason)) => Some(reason),
            Err(report) => {
                println!("{report:?}");

                Some(
                    "Ha ocurrido un error con la comunicación al servidor. \
                    Por favor asegúrese que haya comunicación de internet."
                        .into(),
                )
            }
        }
    }
}

#[macro_use]
extern crate derive_more;

type Report = error_stack::Report<Error>;
type Surreal = surrealdb::Surreal<surrealdb::engine::any::Any>;

#[derive(Clone, Copy, Debug, Display, Error)]
struct Error;

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .setup(|app| {
            app.handle().plugin(tauri_plugin_fs::init())?;

            Ok(())
        })
        .invoke_handler(tauri::generate_handler![command::should_app_disable,])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}

async fn setup_db() -> Result<Surreal, Report> {
    println!("setting up db");

    let db = Surreal::init();

    timeout(
        Duration::from_secs(10),
        db.connect("https://grupoquearasurrealdb.duckdns.org"),
    )
    .await
    .change_context(Error)
    .attach("connecting to db")?
    .change_context(Error)
    .attach("connecting to db")?;

    db.use_ns("yes_music")
        .await
        .change_context(Error)
        .attach("using namespace")?;

    db.use_db("guided_tour")
        .await
        .change_context(Error)
        .attach("using database")?;

    println!("checking db health");

    db.health()
        .await
        .change_context(Error)
        .attach("checking db health")?;

    Ok(db)
}

async fn check_should_disable(db: &Surreal) -> Result<Option<String>, Report> {
    println!("checking to see if app should disable");

    db.query("SELECT VALUE reason FROM ONLY disable_app LIMIT 1")
        .await
        .change_context(Error)
        .attach("sending should app disable query")?
        .check()
        .change_context(Error)
        .attach("sending should app disable query")?
        .take::<Option<String>>(0)
        .change_context(Error)
        .attach("taking should app disable query response")
}
