<script>
    import { router, page } from "@inertiajs/svelte";

    let email = $page.props.email;
    let confirmationCode = '';
    let errorMessage = '';

    async function handleSubmit() {
        try {
            router.post('/verify-account', {
                email: email,
                code: confirmationCode
            });
        } catch (error) {
            console.error('Error:', error);
            errorMessage = 'An unexpected error occurred';
        }
    }
</script>

<main>
    <h1>Verify Your Account</h1>
    <p>Please enter the 6-digit verification code sent to {email}.</p>
    <form on:submit|preventDefault={handleSubmit}>
        <div>
            <label for="confirmation_code">Confirmation Code:</label>
            <input 
                type="text" 
                id="confirmation_code" 
                bind:value={confirmationCode} 
                maxlength="6" 
                required
            >
        </div>
        {#if errorMessage}
            <p class="error">{errorMessage}</p>
        {/if}
        <button type="submit">Verify</button>
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
        font-size: 16px;
    }

    button {
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }

    .error {
        color: red;
    }
</style>