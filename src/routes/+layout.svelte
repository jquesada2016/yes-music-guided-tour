<script lang="ts">
  import { invoke } from "@tauri-apps/api/core";
  import "./layout.css";
  import favicon from "$lib/assets/favicon.svg";

  let { children } = $props();
</script>

<svelte:head>
  <link rel="icon" href={favicon} />
</svelte:head>

{#await invoke<string | undefined>("should_app_disable") then reason}
  {#if reason}
    <main class="min-h-screen flex flex-col justify-center items-center p-8 gap-4">
      <h1 class="text-2xl font-bold">Uh Oh!</h1>
      <p>La app está deshabilitada:</p>
      <p>{reason}</p>
    </main>
  {:else}
    {@render children()}
  {/if}
{/await}
