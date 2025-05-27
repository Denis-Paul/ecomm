// On page load, check if dark mode is enabled in localStorage
if (localStorage.getItem('darkMode') === 'enabled') {
  document.documentElement.classList.add('dark');
}

// Add event listener to the dark mode toggle button
const darkModeToggle = document.getElementById('darkModeToggle');
if (darkModeToggle) {
  darkModeToggle.addEventListener('click', () => {
    // Toggle the dark class on the html element
    document.documentElement.classList.toggle('dark');

    // Update localStorage based on the new state
    if (document.documentElement.classList.contains('dark')) {
      localStorage.setItem('darkMode', 'enabled');
    } else {
      localStorage.setItem('darkMode', 'disabled');
    }
  });
}
