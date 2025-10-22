<script>
	// Generate a random joke from the predefined list
	const getRandomJoke = () => {
		const jokes = [
			"Why don't programmers like nature? Too many bugs.",
			"How many programmers does it take to change a light bulb? None, that's a hardware problem.",
			"Why do Java developers wear glasses? Because they don't see sharp.",
		];
		return jokes[Math.floor(Math.random() * jokes.length)];
	};

	// Initialize with a random joke
	let joke = getRandomJoke();

	// Function to get a new joke
	const generateNewJoke = () => {
		joke = getRandomJoke();
	};
</script>

<main>
	<h3>Joke Generator</h3>
	<p>Random Joke: {joke}</p>
	<button on:click={generateNewJoke}>Get Another Joke</button>
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}
	h3 {
		color: #007bff;
		margin-bottom: 1em;
	}
	p {
		margin: 1em 0;
		font-size: 1.2em;
		color: #333;
	}
	button {
		margin: 1em;
		padding: 0.5em 1em;
		border: none;
		background-color: #28a745;
		color: white;
		cursor: pointer;
		border-radius: 4px;
	}
	button:hover {
		background-color: #218838;
	}
</style>
