<script>
  import { inertia, Link } from '@inertiajs/svelte';
</script>

<nav class="navbar">
  <div class="navbar-brand">
    <a href="/" use:inertia class="navbar-item">My App</a>
  </div>

  <div class="navbar-menu">
    <div class="navbar-start">
      <a href="/home" use:inertia class="navbar-item">Home</a>
      <a href="/about" use:inertia class="navbar-item">About</a>
      <a href="/contact" use:inertia class="navbar-item">Contact</a>
    </div>

    <div class="navbar-end">
      <a href="/login" use:inertia class="navbar-item">Login</a>
      <a href="/signup" use:inertia class="navbar-item">Sign Up</a>
    </div>
  </div>
</nav>

<style>
  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    background-color: #f8f9fa;
  }

  .navbar-brand {
    font-size: 1.5rem;
    font-weight: bold;
  }

  .navbar-menu {
    display: flex;
    justify-content: space-between;
    flex-grow: 1;
  }

  .navbar-start, .navbar-end {
    display: flex;
    align-items: center;
  }

  .navbar-item {
    margin: 0 0.5rem;
    text-decoration: none;
    color: #333;
  }

  .navbar-item:hover {
    color: #007bff;
  }
</style>