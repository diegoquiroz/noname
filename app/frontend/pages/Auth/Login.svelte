<svelte:head>
  <title>Login</title>
</svelte:head>

<script>
  import { useForm } from '@inertiajs/svelte'
  import { Button, Card, Label, Input, Checkbox } from 'flowbite-svelte'
  import FlashMessage from '../../components/Layout/FlashMessage.svelte';
  import { Link } from '@inertiajs/svelte'

  let form = useForm({
    user: {
      email: null,
      password: null,
      remember: false,
    }
  })

  function submit() {
    $form.post('/login')
  }
</script>

<div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">

  <Card class="max-w-md w-full space-y-8">
    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
      Sign in to your account
    </h2>

    <FlashMessage />

    <form class="mt-8 space-y-6" on:submit|preventDefault={submit}>
      <div class="rounded-md shadow-sm space-y-4">
        <div>
          <Label for="email-address" class="sr-only">Email address</Label>
          <Input id="email-address" type="email" placeholder="Email address" required
                 bind:value={$form.user.email} />
        </div>
        <div>
          <Label for="password" class="sr-only">Password</Label>
          <Input id="password" type="password" placeholder="Password" required
                 bind:value={$form.user.password} />
        </div>
      </div>

      {#if $form.errors.email}
        <p class="mt-2 text-sm text-red-600" id="email-error">{$form.errors.email}</p>
      {/if}
      {#if $form.errors.password}
        <p class="mt-2 text-sm text-red-600" id="password-error">{$form.errors.password}</p>
      {/if}

      <div class="flex items-center justify-between">
        <Checkbox id="remember-me" bind:checked={$form.user.remember}>
          Remember me
        </Checkbox>
      </div>

      <Button type="submit" class="w-full" disabled={$form.processing}>
        Sign in
      </Button>
    </form>

    <div class="text-center">
      <p class="text-sm">
        Don't have an account? 
        <Link href="/signup" class="text-blue-600 hover:text-blue-800">
          Sign up
        </Link>
      </p>
    </div>
  </Card>
</div>