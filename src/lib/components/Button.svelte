<script lang="ts">
	import type { Snippet } from 'svelte';

	type Props = {
		imageURL: string;
		imageAlt: string;
		link?: boolean;
		href?: string;
		children: Snippet;
	};

	const { imageURL, imageAlt, link = false, href = '', children }: Props = $props();
</script>

<svelte:element
	this={link ? 'a' : 'button'}
	class="flex gap-4 justify-center items-center bg-white p-4 text-xl rounded-full cursor-pointer"
	{href}
>
	<img class="h-8 w-8" src={imageURL} alt={imageAlt} />
	{@render children()}
</svelte:element>
