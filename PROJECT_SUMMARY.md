# 🏛️ Museo Punchao - Flutter Application

## 📱 Overview
A comprehensive cultural museum mobile application featuring educational content about Andean ceramics and native botanical plants of Peru, with workshop registration system and user authentication.

**App Name:** Museo Punchao  
**Package Name:** com.museopunchao.museum  
**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 🎨 Design System

### Color Palette
- **Primary Purple:** `#581C43` - Deep wine/purple background
- **Accent Turquoise:** `#4DB6AC` - Interactive elements and highlights
- **Text Colors:** White (`#FFFFFF`) and Grey (`#B0B0B0`)
- **Card Background:** `#4A6B6B` - Teal card background

### Visual Elements
- Pill-shaped buttons with rounded corners
- Circular icon buttons for main navigation
- Andean geometric patterns as decorative elements
- Material Design 3 components
- Custom Andean pattern decorations

## 📂 Project Structure

```
lib/
├── main.dart                           # App entry point
├── models/                             # Data models
│   ├── botanical_plant.dart            # Plant data model with sample data
│   ├── workshop.dart                   # Workshop model with phases
│   └── user.dart                       # User authentication model
├── screens/                            # App screens
│   ├── splash_screen.dart              # Initial loading screen
│   ├── login_screen.dart               # User login
│   ├── register_screen.dart            # User registration
│   ├── home_screen.dart                # Main dashboard
│   ├── workshop_detail_screen.dart     # Workshop information & registration
│   ├── botanical_section_screen.dart   # Plant grid view
│   ├── plant_detail_screen.dart        # Individual plant details
│   └── tickets_screen.dart             # Ticket purchasing
├── widgets/                            # Reusable widgets
│   ├── primary_button.dart             # Custom button component
│   ├── circular_icon_button.dart       # Circular navigation buttons
│   ├── andean_pattern_decoration.dart  # Decorative patterns
│   └── info_card.dart                  # Information card component
└── utils/                              # Utilities
    ├── app_theme.dart                  # Theme configuration
    └── app_router.dart                 # Navigation setup with GoRouter
```

## 🚀 Features

### 1. Authentication System
- **Splash Screen:** Branded loading screen with Andean patterns
- **Login Screen:** Email/password authentication with validation
- **Register Screen:** New user registration with form validation

### 2. Dashboard (Home Screen)
Three main navigation sections:
- **Taller de Cerámica y Botánica** - Workshop access
- **Sección Botánica** - Native plants information
- **Entradas** - Ticket purchasing

### 3. Workshop System
- Detailed workshop information (Cerámica y Botánica)
- Three-phase workshop structure:
  - **Fase 1:** Introducción (45 min)
  - **Fase 2:** Técnicas básicas (90 min)
  - **Fase 3:** Creación libre (105 min)
- Workshop registration functionality
- Duration: 4 hours, Max participants: 15
- Price: S/ 85.00

### 4. Botanical Section
Four native Peruvian plants with detailed information:

#### Uña de Gato (Uncaria tomentosa)
- Properties: Inmunoestimulante, Antiinflamatorio, Antioxidante, Antiviral
- Uses: Immune system support, arthritis treatment

#### Maca (Lepidium meyenii)
- Properties: Energizante natural, Afrodisíaco, Regulador hormonal
- Uses: Energy boost, fertility enhancement, hormonal balance

#### Muña (Minthostachys mollis)
- Properties: Digestivo, Carminativo, Expectorante, Aromático
- Uses: Digestive aid, cold treatment, natural insect repellent

#### Hercampuri (Gentianella alborosea)
- Properties: Hepatoprotector, Depurativo, Hipocolesterolemiante
- Uses: Liver cleansing, cholesterol reduction, weight control

### 5. Ticket System
- Three ticket types: Adults (S/ 15), Children (S/ 8), Seniors (S/ 10)
- Quantity selection with increment/decrement controls
- Real-time total calculation
- Purchase confirmation dialog
- Museum visiting information

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  go_router: ^14.6.2              # Navigation routing
  provider: 6.1.5+1               # State management
  shared_preferences: 2.5.3       # Local storage
```

## 🎯 Navigation Flow

```
Splash Screen (3 seconds)
    ↓
Login Screen
    ├── Register Screen
    └── Home Screen (Dashboard)
          ├── Workshop Detail Screen
          │     └── Registration Dialog
          ├── Botanical Section Screen
          │     └── Plant Detail Screen
          └── Tickets Screen
                └── Purchase Dialog
```

## 🛠️ Technical Implementation

### State Management
- Provider pattern for app-wide state
- Local state management with StatefulWidget where appropriate
- Shared preferences for persistent user data

### Navigation
- GoRouter for declarative routing
- Named routes with path parameters
- Extra data passing for complex objects

### Responsive Design
- SingleChildScrollView for scrollable content
- SafeArea for system UI avoidance
- Flexible layouts with Column/Row
- GridView for plant gallery
- CustomScrollView with SliverAppBar for immersive headers

### Data Models
- **BotanicalPlant:** Complete plant information with properties and uses
- **Workshop:** Workshop details with phases and activities
- **User:** User authentication data model

## 🎨 Custom Widgets

1. **PrimaryButton:** Reusable styled button with loading state
2. **CircularIconButton:** Circular navigation buttons with labels
3. **AndeanPatternDecoration:** Custom painter for Andean geometric patterns
4. **InfoCard:** Information display cards with icons

## 📱 Screens Overview

### Splash Screen
- Museum logo with binoculars icon
- Andean patterns (top and bottom)
- Loading indicator
- Auto-navigation to login after 3 seconds

### Login Screen
- Username and password fields
- Password visibility toggle
- Form validation
- Link to registration
- Andean pattern decoration at bottom

### Home Screen (Dashboard)
- Museum branding header
- User profile menu
- Three main circular navigation buttons
- Andean pattern decorations
- User menu with profile, bookings, settings, logout

### Workshop Detail Screen
- Hero image with workshop icon
- Workshop title and description
- Duration and participant info
- Three phases with detailed information
- Price display
- Floating "REGÍSTRATE" button
- Registration confirmation dialog

### Botanical Section Screen
- Grid layout with plant cards (2 columns)
- Plant icons and names
- Scientific names
- Navigation to individual plant details

### Plant Detail Screen
- Large hero icon
- Plant common and scientific names
- Comprehensive description
- Properties displayed as tags
- Uses displayed as checklist
- Scrollable content

### Tickets Screen
- Three ticket types with counters
- Icon-based ticket cards
- Increment/decrement controls
- Real-time total calculation
- Purchase button
- Museum information card
- Purchase confirmation dialog

## 🚀 Getting Started

### Prerequisites
- Flutter 3.35.4 or higher
- Dart 3.9.2 or higher

### Installation
```bash
# Clone the repository
git clone <repository-url>

# Navigate to project directory
cd flutter_app

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Building for Web
```bash
# Build release version
flutter build web --release

# Serve locally
python3 -m http.server 5060 --directory build/web --bind 0.0.0.0
```

### Building for Android
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release
```

## 🎯 Key Features Implemented

✅ Complete authentication flow (Splash, Login, Register)  
✅ Dashboard with three main sections  
✅ Workshop detail with phase-by-phase breakdown  
✅ Botanical plant gallery with 4 native plants  
✅ Individual plant detail views with comprehensive information  
✅ Ticket purchasing system with multiple types  
✅ User menu with profile options  
✅ Custom Andean-themed design system  
✅ Responsive layouts for mobile screens  
✅ Form validation and error handling  
✅ Navigation with GoRouter  
✅ Custom app icon integration  
✅ Material Design 3 theming  

## 🎨 Design Highlights

- **Authentic Andean Aesthetic:** Purple/wine color scheme with turquoise accents
- **Cultural Patterns:** Custom-drawn Andean geometric patterns
- **Circular Navigation:** Large, accessible circular buttons
- **Information Cards:** Teal cards with white text for readability
- **Pill-shaped Buttons:** Highly rounded buttons for modern look
- **Plant Icons:** Material Design icons representing each plant type
- **Hero Transitions:** Smooth navigation with hero images

## 📖 Content Highlights

### Workshop Content
Complete 4-hour workshop covering:
- Andean ceramic history (Moche, Nazca)
- Native medicinal plants introduction
- Traditional ceramic techniques (coiling, modeling)
- Botanical motif decoration
- Natural pigment application
- Personal creative project development

### Botanical Content
Four extensively documented native plants:
- Historical context and cultural significance
- Scientific classification
- Medicinal properties
- Traditional and modern uses
- Preparation methods

## 🔮 Future Enhancements

- [ ] Firebase integration for backend data
- [ ] User profile management
- [ ] Booking history
- [ ] Payment gateway integration
- [ ] Push notifications for workshops
- [ ] Plant identification with camera
- [ ] AR experiences for exhibits
- [ ] Multi-language support (Quechua, English)
- [ ] Social sharing features
- [ ] Review and rating system

## 📄 License

This project is part of the Museo Punchao cultural initiative.

## 🙏 Acknowledgments

- Design inspired by traditional Andean art and culture
- Plant information based on traditional Peruvian medicine
- Workshop structure developed in consultation with ceramic artists

---

**Built with Flutter 💙 | Preserving Andean Heritage 🏛️**
