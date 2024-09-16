<script>
    import { page } from '@inertiajs/svelte'
    import { Alert } from 'flowbite-svelte';
  
    let color = 'green'
  
    $: flash = $page.props.flash
    $: show = $page.props.has_flash
    
    let msg = ''
  
    $: if (show) {
      if (flash.alert) {
        color = 'red'
        msg = flash.alert
      }
  
      if (flash.notice) {
        color = 'blue'
        msg = flash.notice
      }
  
      if (flash.success) {
        color = 'green'
        msg = flash.success
      }
    }
  </script>
  
{#if show}
  <Alert color={color}>
    {#each flash.alert as message}
      - {message}
      <br>
    {/each}
  </Alert>
{/if}