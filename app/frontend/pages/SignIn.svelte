<script>
    import { router } from "@inertiajs/svelte";

  let email = '';
  let password = '';
  let errorMessage = '';

  async function handleSubmit() {
    try {
        router.post('/login', {
            email,
            password
        })
    } catch (error) {
      console.error('Error:', error);
      errorMessage = 'An unexpected error occurred';
    }
  }
</script>

<main>
  <h1>Sign In</h1>
  <form on:submit|preventDefault={handleSubmit}>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" bind:value={email} required>
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" bind:value={password} required>
    </div>
    {#if errorMessage}
      <p class="error">{errorMessage}</p>
    {/if}
    <button type="submit">Sign In</button>
  </form>
</main>

<style>
  main {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
  }

  h1 {
    text-align: center;
  }

  form {
    display: flex;
    flex-direction: column;
  }

  div {
    margin-bottom: 15px;
  }

  label {
    display: block;
    margin-bottom: 5px;
  }

  input {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }

  button {
    padding: 10px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
  }

  button:hover {
    background-color: #45a049;
  }

  .error {
    color: red;
    margin-bottom: 10px;
  }
</style>
