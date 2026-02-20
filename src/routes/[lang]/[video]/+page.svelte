<script lang="ts">
  import { page } from "$app/state";
  import { resolveResource } from "@tauri-apps/api/path";
  import { convertFileSrc } from "@tauri-apps/api/core";

  const { lang, video } = page.params;

  const videoPath = `/videos/${lang}/${video}.mp4`;
</script>

<div class="min-h-screen flex flex-col bg-black">
  <nav class="text-white">
    <a class="inline-flex justify-center items-center p-4 cursor-pointer" href="../">
      <span class="icon">arrow_back</span>
    </a>
  </nav>
  <main class="grow flex items-center">
    <video class="h-full" src={videoPath} autoplay controls></video>
  </main>
</div>
