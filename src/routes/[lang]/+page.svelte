<script lang="ts">
  import { page } from "$app/state";
  import { Button } from "$lib";
  import backgroundImg from "$lib/assets/wheel-background.jpg";
  import wheelImg from "$lib/assets/wheel.jpg";
  import factoryImg from "$lib/assets/factory.jpg";
  import spokeWheelImg from "$lib/assets/spoke-wheel.jpg";
  import artisanalImg from "$lib/assets/artisanal.jpg";

  type Language = "en" | "es" | "de" | "fr";

  type Translations = {
    en: Translation;
    es: Translation;
    de: Translation;
    fr: Translation;
  };

  type Translation = {
    zone: string;
    selectZone: string;
    kiosk: string;
    workshop: string;
    wheel: string;
    paintJob: string;
  };

  const lang = page.params.lang as Language;

  const en: Translation = {
    zone: "Zone",
    selectZone: "Select Your Zone",
    kiosk: "Kiosk",
    workshop: "Workshop",
    wheel: "Wheel",
    paintJob: "Paint Job",
  };

  const es: Translation = {
    zone: "Zona",
    selectZone: "Seleccione su Zona",
    kiosk: "Kiosko",
    workshop: "Taller",
    wheel: "Rueda",
    paintJob: "Pintura",
  };

  const de: Translation = {
    zone: "Zone",
    selectZone: "Wählen Sie Ihre Zone",
    kiosk: "Kiosk",
    workshop: "Werkstatt",
    wheel: "Wagenrad",
    paintJob: "Bemalung",
  };

  const fr: Translation = {
    zone: "Zone",
    selectZone: "Sélectionnez votre zone",
    kiosk: "kiosque",
    workshop: "atelier",
    wheel: "roue",
    paintJob: "peinture",
  };

  const translations: Translations = {
    en,
    es,
    de,
    fr,
  };

  const trans = translations[lang];
</script>

<div class="min-h-screen flex flex-col bg-cover" style={`background-image: url(${backgroundImg})`}>
  <nav class="text-white">
    <a class="inline-flex justify-center items-center p-4 cursor-pointer" href="../">
      <span class="icon">arrow_back</span>
    </a>
  </nav>
  <main class="grow flex flex-col gap-8 justify-end p-8">
    <div class="p-8 grow flex justify-center items-center">
      <h1 class="text-5xl text-white">{trans.zone}</h1>
    </div>
    <p class="text-2xl text-white text-center">{trans.selectZone}</p>
    <div class="grid grid-cols-2 grid-rows-2 gap-8">
      <Button imageURL={wheelImg} imageAlt="Wheel" link href="./kiosko/">{trans.kiosk}</Button>
      <Button imageURL={factoryImg} imageAlt="Factory" link href="./taller/"
        >{trans.workshop}</Button
      >
      <Button imageURL={spokeWheelImg} imageAlt="Spoke wheel" link href="./rueda/"
        >{trans.wheel}</Button
      >
      <Button imageURL={artisanalImg} imageAlt="Paint" link href="./pintura/"
        >{trans.paintJob}</Button
      >
    </div>
  </main>
</div>
