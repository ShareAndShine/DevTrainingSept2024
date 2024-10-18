// Hotel Class
class Hotel {
    constructor(name) {
        this.name = name;
        this.reviews = [];
        this.ratings = [];
        this.averageRating = null;
    }

    // Add a review (simulating async API call)
    async addReview(review) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                if (review) {
                    this.reviews.push(review);
                    resolve(`Review added: "${review}"`);
                } else {
                    reject("Invalid review.");
                }
            }, 1000); // Simulate async behavior
        });
    }

    // Add a rating (simulating async API call)
    async addRating(rating) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                if (rating >= 1 && rating <= 5) {
                    this.ratings.push(rating);
                    this.updateAverageRating();
                    resolve(`Rating added: ${rating}`);
                } else {
                    reject("Invalid rating. Rating must be between 1 and 5.");
                }
            }, 1000); // Simulate async behavior
        });
    }

    // Update the average rating
    updateAverageRating() {
        const sum = this.ratings.reduce((acc, rate) => acc + rate, 0);
        this.averageRating = (sum / this.ratings.length).toFixed(2);
    }
}

// HotelManager Class
class HotelManager {
    constructor() {
        this.hotels = [];
    }

    // Fetch hotels (simulating async API call)
    async fetchHotels() {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                const storedHotels = JSON.parse(localStorage.getItem('hotels')) || [];
                this.hotels = storedHotels.map(h => new Hotel(h.name)); // Rehydrate hotel objects
                resolve(this.hotels);
            }, 1000); // Simulate async data fetching
        });
    }

    // Add a new hotel
    async addHotel(name) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                if (name) {
                    const hotel = new Hotel(name);
                    this.hotels.push(hotel);
                    this.saveHotels();
                    resolve(hotel);
                } else {
                    reject("Hotel name is required.");
                }
            }, 1000);
        });
    }

    // Save hotels to local storage
    saveHotels() {
        localStorage.setItem('hotels', JSON.stringify(this.hotels));
    }
}

// Initialize hotel manager
const hotelManager = new HotelManager();

// DOM manipulation and event handling
document.addEventListener('DOMContentLoaded', async () => {
    const hotelList = document.getElementById('hotel-list');
    const hotelNameInput = document.getElementById('hotel-name');
    const addHotelButton = document.getElementById('add-hotel');

    // Load hotels on page load
    try {
        const hotels = await hotelManager.fetchHotels();
        displayHotels(hotels);
    } catch (error) {
        console.error(error);
    }

    // Add new hotel event
    addHotelButton.addEventListener('click', async () => {
        const hotelName = hotelNameInput.value.trim();
        if (hotelName) {
            try {
                const newHotel = await hotelManager.addHotel(hotelName);
                displayHotels(hotelManager.hotels); // Reload hotel list
                hotelNameInput.value = ''; // Clear input field
            } catch (error) {
                alert(error);
            }
        } else {
            alert('Please enter a hotel name.');
        }
    });

    // Function to display hotels
    const displayHotels = (hotels) => {
        hotelList.innerHTML = '';
        hotels.forEach((hotel, index) => {
            const hotelElement = createHotelElement(hotel, index);
            hotelList.appendChild(hotelElement);
        });
    };

    // Create hotel DOM element
    const createHotelElement = (hotel, index) => {
        const hotelDiv = document.createElement('div');
        hotelDiv.classList.add('slds-box');
        hotelDiv.innerHTML = `
            <h3>${hotel.name}</h3>
            <div class="rating">
                <label>Rate this hotel:</label>
                <select class="rate-hotel">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
                <button class="slds-button slds-button_neutral rate-btn">Submit Rating</button>
                <span>Average Rating: <strong>${hotel.averageRating || 'No rating'}</strong></span>
            </div>
            <div class="review-section">
                <input type="text" class="slds-input review-input" placeholder="Leave a review">
                <button class="slds-button slds-button_brand add-review-btn">Add Review</button>
                <div class="review-list">
                    ${hotel.reviews.map(review => `<div class="slds-text-body_regular review">${review}</div>`).join('')}
                </div>
            </div>
        `;

        // Add review event
        const addReviewBtn = hotelDiv.querySelector('.add-review-btn');
        addReviewBtn.addEventListener('click', async () => {
            const reviewInput = hotelDiv.querySelector('.review-input');
            const reviewText = reviewInput.value.trim();

            if (reviewText !== '') {
                try {
                    await hotel.addReview(reviewText);
                    hotelManager.saveHotels();
                    displayHotels(hotelManager.hotels); // Reload the hotel list to reflect the new review
                } catch (error) {
                    alert('Failed to add review. ' + error);
                }
            }
        });

        // Add rating event
        const rateBtn = hotelDiv.querySelector('.rate-btn');
        rateBtn.addEventListener('click', async () => {
            const rating = parseInt(hotelDiv.querySelector('.rate-hotel').value);
            try {
                await hotel.addRating(rating);
                hotelManager.saveHotels();
                displayHotels(hotelManager.hotels); // Reload to update average rating
            } catch (error) {
                alert('Failed to submit rating. ' + error);
            }
        });

        return hotelDiv;
    };
});
