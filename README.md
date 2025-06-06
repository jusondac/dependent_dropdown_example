# 📍 Location Manager - Dependent Dropdown System

A modern Rails 8 application demonstrating a dependent dropdown system for Country → Province/State → City selection. Built with **Stimulus JS** for seamless frontend interactions and **Tailwind CSS** for beautiful, responsive design.

## ✨ Features

- **Dependent Dropdowns**: Country selection dynamically loads provinces, province selection loads cities
- **Modern UI**: Clean, minimalist design with Tailwind CSS
- **Responsive Design**: Works perfectly on desktop and mobile devices
- **Real-time Updates**: Instant dropdown updates without page reload
- **Form Validation**: Proper validation with helpful error messages
- **CRUD Operations**: Full Create, Read, Update, Delete functionality for locations
- **Data Integrity**: Ensures provinces belong to selected countries and cities to provinces

## 🚀 Quick Start

### Prerequisites

- Ruby 3.1+
- Rails 8.0+
- SQLite3

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd dependentdropdown
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the application**
   Open your browser and navigate to `http://localhost:3000`

## 🎬 Demo

The application comes with sample data including:
- **3 Countries**: United States, Canada, United Kingdom
- **9 Provinces/States**: California, Texas, New York, Ontario, Quebec, British Columbia, England, Scotland, Wales
- **36 Cities**: Major cities for each province/state

### User Experience Flow

1. **Home Page**: View all existing locations in a clean, responsive table
2. **Add Location**: Click "Add Location" to access the form
3. **Country Selection**: Choose from available countries
4. **Province Auto-load**: Provinces automatically populate based on country selection
5. **City Auto-load**: Cities automatically populate based on province selection
6. **Save**: Submit the form to create a new location
7. **View/Edit**: Access individual location details or edit existing locations

## 🏗️ Architecture

### Models

- **Country**: Root level geographical entity
- **Province**: Belongs to a country (states, provinces, regions)
- **City**: Belongs to a province
- **Location**: The main entity that references country, province, and city

### Controllers

- **LocationsController**: Handles CRUD operations for locations
- **Api::LocationDataController**: Provides JSON endpoints for dependent dropdown data

### Frontend

- **Stimulus Controller**: `dependent_dropdown_controller.js` manages the dropdown interactions
- **Tailwind CSS**: Provides modern, responsive styling

## 🎯 How It Works

### Dependent Dropdown Flow

1. **Country Selection**: User selects a country from the dropdown
2. **Province Loading**: Stimulus controller fetches provinces for selected country via AJAX
3. **Province Selection**: User selects a province from the populated dropdown
4. **City Loading**: Stimulus controller fetches cities for selected province via AJAX
5. **Form Submission**: All three selections are saved together

### API Endpoints

```
GET /api/provinces/:country_id    # Returns provinces for a country
GET /api/cities/:province_id      # Returns cities for a province
```

### Stimulus Controller Data Flow

```javascript
// Controller targets
country → province → city

// Controller actions
countryChanged() → loadProvinces() → populateSelect()
provinceChanged() → loadCities() → populateSelect()
```

## 📱 User Interface

### Pages

1. **Location Index** (`/`)
   - Clean table view of all locations
   - Search and filter capabilities
   - Action buttons for View, Edit, Delete

2. **New Location** (`/locations/new`)
   - Form with dependent dropdowns
   - Real-time validation
   - Modern form styling

3. **Edit Location** (`/locations/:id/edit`)
   - Pre-populated form with existing data
   - Maintains dropdown dependencies
   - Seamless updates

4. **Location Details** (`/locations/:id`)
   - Beautiful card layout
   - All location information displayed
   - Quick action buttons

### Design Features

- **Responsive Grid Layouts**: Adapts to different screen sizes
- **Loading States**: Disabled dropdowns until parent selection is made
- **Error Handling**: User-friendly error messages
- **Interactive Elements**: Hover effects and smooth transitions
- **Icons**: SVG icons for better visual hierarchy

## 🛠️ Technical Details

### Database Schema

```ruby
# Countries
create_table "countries" do |t|
  t.string "name", null: false
  t.timestamps
end

# Provinces
create_table "provinces" do |t|
  t.string "name", null: false
  t.references "country", null: false, foreign_key: true
  t.timestamps
end

# Cities
create_table "cities" do |t|
  t.string "name", null: false
  t.references "province", null: false, foreign_key: true
  t.timestamps
end

# Locations
create_table "locations" do |t|
  t.string "name", null: false
  t.references "country", null: false, foreign_key: true
  t.references "province", null: false, foreign_key: true
  t.references "city", null: false, foreign_key: true
  t.timestamps
end
```

### Key Files

```
app/
├── controllers/
│   ├── locations_controller.rb              # Main CRUD controller
│   └── api/location_data_controller.rb      # API endpoints
├── models/
│   ├── country.rb                          # Country model with associations
│   ├── province.rb                         # Province model
│   ├── city.rb                            # City model
│   └── location.rb                        # Location model with validations
├── javascript/controllers/
│   └── dependent_dropdown_controller.js    # Stimulus controller
└── views/locations/
    ├── index.html.erb                      # Location listing
    ├── new.html.erb                       # New location form
    ├── edit.html.erb                      # Edit location form
    ├── show.html.erb                      # Location details
    └── _form.html.erb                     # Shared form partial
```

## 🎨 Styling & UI

### Tailwind CSS Classes Used

- **Layout**: `grid`, `flex`, `max-w-*`, `mx-auto`, `px-*`, `py-*`
- **Colors**: `bg-gray-50`, `text-gray-900`, `border-gray-300`
- **Interactive**: `hover:bg-*`, `focus:ring-*`, `transition-colors`
- **Components**: `rounded-lg`, `shadow-sm`, `border`

### Responsive Design

- Mobile-first approach
- Responsive grid layouts (`sm:grid-cols-2`)
- Adaptive navigation and forms
- Touch-friendly button sizes

## 🔧 Customization

### Adding New Geographic Levels

To add more levels (e.g., Districts, Neighborhoods):

1. **Create Migration**
   ```bash
   rails generate model District name:string city:references
   ```

2. **Update Models**
   ```ruby
   # city.rb
   has_many :districts, dependent: :destroy
   
   # district.rb
   belongs_to :city
   ```

3. **Extend Stimulus Controller**
   ```javascript
   // Add district target and methods
   static targets = ["country", "province", "city", "district"]
   ```

### Styling Customization

The application uses Tailwind CSS utility classes. To customize:

1. **Colors**: Update color schemes in form and layout files
2. **Spacing**: Modify `px-*`, `py-*`, `m-*` classes
3. **Typography**: Change `text-*`, `font-*` classes
4. **Components**: Customize button, card, and form styles

## 📊 Performance Considerations

- **Lazy Loading**: Dropdowns load data only when needed
- **Caching**: Consider adding Rails caching for frequently accessed data
- **Database Indexing**: Foreign keys are indexed by default
- **N+1 Queries**: Uses `includes()` to prevent N+1 queries in listing pages

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Built with [Ruby on Rails 8](https://rubyonrails.org/)
- Frontend powered by [Stimulus](https://stimulus.hotwired.dev/)
- Styled with [Tailwind CSS](https://tailwindcss.com/)
- Icons from [Heroicons](https://heroicons.com/)

---

**Happy Coding!** 🎉

For questions or support, please open an issue in the repository.
