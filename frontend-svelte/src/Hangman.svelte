<script>
    let gameId = null;
    let guessedWord = "";
    let remainingAttempts = 6;
    let status = "playing";
    let letter = "";
    let inputElement;
    let correctWord = ""; // New variable to store the correct word on loss

    async function startGame() {
        const response = await fetch("http://localhost:4000/start", {
            method: "POST",
        });
        const data = await response.json();
        gameId = data.game_id;
        guessedWord = "_".repeat(data.word_length); // Initialize guessed word
        remainingAttempts = 6;
        status = "playing";
        correctWord = ""; // Reset correct word on game restart
        focusInput();
    }

    async function guessLetter() {
        if (!letter || letter.length !== 1) {
            alert("Enter a valid single letter!");
            return;
        }

        const response = await fetch("http://localhost:4000/guess", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ game_id: gameId, letter }),
        });
        const data = await response.json();

        if (data.error) {
            alert(data.error);
            return;
        }

        // Update guessed word with correctly guessed letters
        guessedWord = data.guessed_word;
        remainingAttempts = data.remaining_attempts;
        status = data.status;
        correctWord = data.word; // Update correct word if game is lost
        letter = "";
        focusInput();
    }

    function focusInput() {
        if (inputElement) {
            inputElement.focus();
        }
    }
</script>

<div>
    {#if !gameId}
        <button on:click={startGame}>Start Game</button>
    {:else}
        <p><strong>Word:</strong> <span class="word">{guessedWord}</span></p>

        <p>Remaining Attempts: {remainingAttempts}</p>
        <p>Status: {status}</p>

        {#if status === "lost"}
            <p><strong>Correct Word:</strong> {correctWord}</p> <!-- Show correct word if lost -->
        {/if}

        {#if status === "playing"}
            <input
                type="text"
                bind:value={letter}
                maxlength="1"
                bind:this={inputElement}
                on:input={() => focusInput()}
            />
            <button on:click={guessLetter}>Guess</button>
        {/if}

        {#if status !== "playing"}
            <button on:click={startGame}>Restart</button>
        {/if}
    {/if}
</div>


<style>
    div {
        text-align: center;
        font-family: "Poppins", sans-serif;
        max-width: 500px;
        margin: 50px auto;
        padding: 20px;
        border: 2px solid #f0f0f0;
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        background-color: #f9f9f9;
    }

    p {
        font-size: 18px;
        margin: 10px 0;
        color: #333;
    }

    button {
        margin: 10px;
        padding: 12px 20px;
        font-size: 16px;
        font-weight: 600;
        color: white;
        background: linear-gradient(90deg, #ff6a00, #ee0979);
        border: none;
        border-radius: 25px;
        cursor: pointer;
        box-shadow: 0 4px 10px rgba(255, 106, 0, 0.2);
        transition:
            transform 0.2s ease,
            box-shadow 0.2s ease;
    }

    button:hover {
        transform: scale(1.05);
        box-shadow: 0 6px 14px rgba(255, 106, 0, 0.3);
    }

    input {
        margin: 10px 0;
        padding: 10px;
        font-size: 16px;
        width: 80%;
        border: 2px solid #ddd;
        border-radius: 5px;
        outline: none;
        transition: border-color 0.3s ease;
    }

    input:focus {
        border-color: #ff6a00;
    }

    .word {
    font-family: "Courier New", Courier, monospace; /* Monospace for consistent spacing */
    letter-spacing: 0.3em; /* Add spacing between underscores */
    font-size: 20px; /* Make it larger for visibility */
    display: inline-block; /* Ensures consistent layout */
}

</style>
