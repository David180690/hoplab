<script>
  import Counter from "./lib/Counter.svelte";
  import UploadFile from "./UploadFile.svelte";
  import Hangman from "./Hangman.svelte";
  import NavBar from "./NavBar.svelte";
  import Home from "./Home.svelte";
  import JokeGenerator from "./JokeGenerator.svelte";

  const pages = {
    UploadFile,
    Hangman,
    Home,
    JokeGenerator,
  };

  let activePage = "Home";

  function setPage(page) {
    activePage = page;
  }
</script>

<NavBar {activePage} {setPage} />

<!-- 🔽 A tartalom konténer -->
<div class="main-container">
  {#if activePage === "Home"}
    <h1>Welcome to the App!</h1>
    <p>Select a feature to start.</p>
    <Counter />
  {:else if pages[activePage]}
    <svelte:component this={pages[activePage]} />
  {:else}
    <p>Unknown page: {activePage}</p>
  {/if}
</div>

<style>
  /* Navbar fixen fent van */
  :global(nav) {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background: rgba(13, 110, 253, 0.8);
    color: white;
    z-index: 1000;
    backdrop-filter: blur(12px);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
  }

  /* Tartalom eltolása, hogy ne csússzon be a nav alá */
  .main-container {
    margin-top: 80px; /* ez kb. a NavBar magassága */
    padding: 20px;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
  }

  h1 {
    text-align: center;
    margin-bottom: 10px;
  }
</style>
