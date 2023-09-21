import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tagline"];
  currentIndex = 0;

  connect() {
    // Show first tagline on page load
    this.showTagline();
  }

  showTagline() {
    this.taglineTargets.forEach((tagline, index) => {
      tagline.style.display = this.currentIndex === index ? "block" : "none";
    });
  }

  changeTagline(event) {
    switch(event.type) {
      case "wheel":
        this.handleScroll(event);
        break;
      case "keydown":
        this.handleArrowKey(event);
        break;
      case "touchstart":
        this.handleTouchStart(event);
        break;
      case "touchend":
        this.handleTouchEnd(event);
        break;
    }
  }

  handleScroll(event) {
    // Hide the current tagline
    this.taglineTargets[this.currentIndex].style.display = "none";

    // Calculate the new index based on scroll direction
    if (event.deltaY > 0) {
      this.currentIndex = (this.currentIndex + 1) % this.taglineTargets.length;
    } else {
      this.currentIndex = (this.currentIndex - 1 + this.taglineTargets.length) % this.taglineTargets.length;
    }

    // Show the new tagline
    this.showTagline();
  }

  handleArrowKey(event) {
    // Hide the current tagline
    this.taglineTargets[this.currentIndex].style.display = "none";

    // Calculate the new index based on the arrow key pressed
    if (event.key === "ArrowUp" || event.key === "ArrowLeft") {
      this.currentIndex = (this.currentIndex - 1 + this.taglineTargets.length) % this.taglineTargets.length;
    } else if (event.key === "ArrowDown" || event.key === "ArrowRight") {
      this.currentIndex = (this.currentIndex + 1) % this.taglineTargets.length;
    }

    // Show the new tagline
    this.showTagline();
  }

  handleTouchStart(event) {
    // Store the initial touch position
    this.touchStartY = event.touches[0].clientY;
  }

  handleTouchEnd(event) {
    // Hide the current tagline
    this.taglineTargets[this.currentIndex].style.display = "none";

    // Calculate the difference between the initial and final touch positions
    const touchEndY = event.changedTouches[0].clientY;
    const deltaY = touchEndY - this.touchStartY;
  
    // Determine if it's a scroll up or scroll down
    if (deltaY > 0) {
      // Scroll down
      this.currentIndex = (this.currentIndex - 1 + this.taglineTargets.length) % this.taglineTargets.length;
    } else if (deltaY < 0) {
      // Scroll up
      this.currentIndex = (this.currentIndex + 1) % this.taglineTargets.length;
    }

    // Show the new tagline
    this.showTagline();
  }
}
