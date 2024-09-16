<svelte:head>
  <title>Sign Up</title>
</svelte:head>

<script>
  import { useForm, Link } from '@inertiajs/svelte'
  import { Button, Card, Label, Input } from 'flowbite-svelte'
  import FlashMessage from '../../components/Layout/FlashMessage.svelte';

  let form = useForm({
    user: {
      first_name: null,
      last_name: null,
      email: null,
      password: null,
      password_confirmation: null,
    }
  })

  function submit() {
    $form.post('/signup')
  }
</script>

<div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
  <Card class="max-w-md w-full space-y-8">
    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
      Create your account
    </h2>

    <FlashMessage />

    <form class="mt-8 space-y-6" on:submit|preventDefault={submit}>
      <div class="rounded-md shadow-sm space-y-4">
        <div>
          <Label for="first-name" class="sr-only">First Name</Label>
          <Input id="first-name" type="text" placeholder="First Name" required
                 bind:value={$form.user.first_name} />
        </div>
        <div>
          <Label for="last-name" class="sr-only">Last Name</Label>
          <Input id="last-name" type="text" placeholder="Last Name" required
                 bind:value={$form.user.last_name} />
        </div>
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
        <div>
          <Label for="password-confirmation" class="sr-only">Confirm Password</Label>
          <Input id="password-confirmation" type="password" placeholder="Confirm Password" required
                 bind:value={$form.user.password_confirmation} />
        </div>
      </div>

      {#if $form.errors.first_name}
        <p class="mt-2 text-sm text-red-600" id="first-name-error">{$form.errors.first_name}</p>
      {/if}
      {#if $form.errors.last_name}
        <p class="mt-2 text-sm text-red-600" id="last-name-error">{$form.errors.last_name}</p>
      {/if}
      {#if $form.errors.email}
        <p class="mt-2 text-sm text-red-600" id="email-error">{$form.errors.email}</p>
      {/if}
      {#if $form.errors.password}
        <p class="mt-2 text-sm text-red-600" id="password-error">{$form.errors.password}</p>
      {/if}
      {#if $form.errors.password_confirmation}
        <p class="mt-2 text-sm text-red-600" id="password-confirmation-error">{$form.errors.password_confirmation}</p>
      {/if}

      <Button type="submit" class="w-full" disabled={$form.processing}>
        Sign up
      </Button>
    </form>

    <div class="text-center">
      <p class="text-sm">
        Already have an account? 
        <Link href="/login" class="text-blue-600 hover:text-blue-800">
          Log in
        </Link>
      </p>
    </div>
  </Card>
</div>
