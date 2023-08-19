document.addEventListener('DOMContentLoaded', function() {
  const body = document.body;

  function updateBackground() {
    console.log("Background update triggered");
    const scrollPercent = (window.scrollY / (body.scrollHeight - window.innerHeight)) * 100;

    let hue = 240 - scrollPercent;
    let saturation = 100;
    let lightness_start = 25 + 0.5 * scrollPercent;
    let lightness_end = lightness_start + 5;

    body.style.background = `linear-gradient(
        40deg,
        hsl(${hue}deg, ${saturation}%, ${lightness_start}%) 0%,
        hsl(${hue}deg, ${saturation}%, ${lightness_end}%) 100%
      )`;
  }

  // Set the background when the page first loads.
  updateBackground();

  // Update the background as the user scrolls.
  window.addEventListener('scroll', updateBackground);
});
