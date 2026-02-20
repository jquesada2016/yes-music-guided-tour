<script lang="ts">
  import { Button } from "$lib";
  import backgroundImg from "$lib/assets/building.jpg";
  import crFlagImg from "$lib/assets/cr-flag.jpg";
  import enFlagImg from "$lib/assets/en-flag.jpg";
  import nlFlagImg from "$lib/assets/nl-flag.jpg";
  import frFlagImg from "$lib/assets/fr-flag.jpg";
</script>

<div class="min-h-screen flex flex-col bg-cover" style={`background-image: url(${backgroundImg})`}>
  <nav class="h-8"></nav>
  <main class="grow flex flex-col gap-8 justify-end p-8">
    <div class="p-8 grow flex justify-center items-center">
      <h1 class="text-5xl text-white">¡Bienvenido!</h1>
    </div>
    <p class="text-xl text-center text-white">Seleccione su idioma</p>
    <div class="grid grid-cols-2 grid-rows-2 gap-8">
      <Button imageURL={crFlagImg} imageAlt="Costa Rican flag" link href="/es/">Español</Button>
      <Button imageURL={enFlagImg} imageAlt="English flat" link href="/en/">English</Button>
      <Button imageURL={nlFlagImg} imageAlt="Netherlands flag" link href="/de/">Deutsch</Button>
      <Button imageURL={frFlagImg} imageAlt="French flag" link href="/fr/">Français</Button>
    </div>
  </main>
</div>
