<script>
  export let setPage;
  export let activePage = "Home";
  let menuOpen = false;

  const handlePageChange = (page) => {
    activePage = page;
    setPage(page);
    menuOpen = false; // zárjuk be a menüt mobilon
  };
</script>

<nav>
  <div class="nav-container">
    <div class="logo">🍺 HopLab</div>

    <!-- Hamburger ikon mobilra -->
    <div class="menu-toggle" on:click={() => (menuOpen = !menuOpen)}>
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>

    <div class="links" class:open={menuOpen}>
      <button
        on:click={() => handlePageChange("Home")}
        class:active={activePage === "Home"}
      >
        Home
      </button>

      <button
        on:click={() => handlePageChange("JokeGenerator")}
        class:active={activePage === "JokeGenerator"}
      >
        Jokes
      </button>

      <button
        on:click={() => handlePageChange("Hangman")}
        class:active={activePage === "Hangman"}
      >
        Hangman
      </button>

      <button
        on:click={() => handlePageChange("UploadFile")}
        class:active={activePage === "UploadFile"}
      >
        Upload File
      </button>
    </div>
  </div>
</nav>

<style>
  nav {
    position: fixed;
    top: 0;
    width: 100%;
    backdrop-filter: blur(12px);
    background: rgba(13, 110, 253, 0.8);
    color: white;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
    z-index: 1000;
    transition: background 0.3s ease;
  }

  .nav-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 12px 24px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .logo {
    font-size: 1.6rem;
    font-weight: 800;
    letter-spacing: 1px;
    cursor: default;
    user-select: none;
  }

  .links {
    display: flex;
    gap: 12px;
    transition: all 0.3s ease;
  }

  button {
    padding: 10px 18px;
    font-size: 15px;
    font-weight: 600;
    cursor: pointer;
    background-color: rgba(255, 255, 255, 0.15);
    color: white;
    border: 2px solid transparent;
    border-radius: 25px;
    transition: all 0.25s ease;
  }

  button:hover {
    background-color: rgba(255, 255, 255, 0.25);
    transform: translateY(-2px);
  }

  button.active {
    background-color: #ffc107;
    color: #212529;
    font-weight: 700;
    border-color: rgba(255, 255, 255, 0.3);
  }

  button:active {
    transform: scale(0.97);
  }

  /* ======= Mobilnézet ======= */
  .menu-toggle {
    display: none;
    flex-direction: column;
    gap: 5px;
    cursor: pointer;
  }

  .bar {
    width: 25px;
    height: 3px;
    background: white;
    border-radius: 3px;
    transition: all 0.3s ease;
  }

  @media (max-width: 768px) {
    .menu-toggle {
      display: flex;
    }

    .links {
      position: absolute;
      top: 70px;
      left: 0;
      right: 0;
      flex-direction: column;
      align-items: center;
      background: rgba(13, 110, 253, 0.95);
      backdrop-filter: blur(10px);
      padding: 1rem 0;
      border-radius: 0 0 12px 12px;
      opacity: 0;
      pointer-events: none;
      transform: translateY(-20px);
    }

    .links.open {
      opacity: 1;
      pointer-events: auto;
      transform: translateY(0);
    }

    button {
      width: 80%;
    }
  }
</style>
