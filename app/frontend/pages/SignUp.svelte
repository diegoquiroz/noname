<script>
    import { router } from "@inertiajs/svelte";


  let name = '';
  let email = '';
  let password = '';
  let confirmPassword = '';
  let errorMessage = '';

  async function handleSubmit() {
    if (password !== confirmPassword) {
      errorMessage = 'Passwords do not match';
      return;
    }

    try {
        router.post('/signup', {
            name,
            email,
            password
        })
    //   const response = await fetch('/users', {
    //     method: 'POST',
    //     headers: {
    //       'Content-Type': 'application/json',
    //     },
    //     body: JSON.stringify({ name, email, password }),
    //   });

    //   if (response.ok) {
    //     // navigate('/login', { replace: true });
    //   } else {
    //     const data = await response.json();
    //     errorMessage = data.error || 'Error creating user';
    //   }
    } catch (error) {
      console.error('Error:', error);
      errorMessage = 'An unexpected error occurred';
    }
  }
</script>

<main>
  <h1>Sign Up</h1>
  <form on:submit|preventDefault={handleSubmit}>
    <div>
      <label for="name">Name:</label>
      <input type="text" id="name" bind:value={name} required>
    </div>
    <div>
      <label for="email">Email:</label>
      <input type="email" id="email" bind:value={email} required>
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" bind:value={password} required>
    </div>
    <div>
      <label for="confirmPassword">Confirm Password:</label>
      <input type="password" id="confirmPassword" bind:value={confirmPassword} required>
    </div>
    {#if errorMessage}
      <p class="error">{errorMessage}</p>
    {/if}
    <button type="submit">Sign Up</button>
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
