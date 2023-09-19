# Couchsurfing app összefoglaló dokumentum

## Belépési flow

### Indulási képernyő

- Képernyőterv:\
<img src="markdown_images/design/startup_design.png" alt="indulási képernyő design" height="500"/>

- Képernyő:\
<img src="markdown_images/views/StartupView.png" alt="indulási képernyő" height="500"/>

- Backend érintettség: -

### Bejelentkezési képernyő

- Képernyőterv:\
<img src="markdown_images/design/login_design.png" alt="bejelentkezési képernyő design" height="500"/>

- Képernyő:\
<img src="markdown_images/views/LoginView.png" alt="bejelentkezési képernyő" height="500"/>

- Backend érintettség:\
    - <u>Végpont:</u> **POST /api/auth/login**
    - <u>Kérés:</u>\
    Body-ban:
    ```javascript
    {
        email: string,
        password: string
    }
    ```
    - <u>Válasz:</u>
        - Sikeres: **200-as státuszkód**, body-ban:
        ```javascript
        {
            accessToken: string,
            timeout: long,
            tokenType: string,
            roles: string[]
        }
        ```
        - Hiba ág: **404-es hibakód** kerül visszaküldésre a kliensnek

### Regisztrációs képernyő

- Képernyőterv:\
<img src="markdown_images/design/signup_design.png" alt="regisztrációs képernyő design" height=500/>

- Képernyő:\
<img src="markdown_images/views/RegistrationView.png" alt="regisztrációs képernyő" height=500/>

- Backend érintettség:\
    - <u>Végpont:</u> **POST /api/auth/register**
    - <u>Kérés:</u>\
    Body-ban:
    ```javascript
    {
        fullName: string,
        username: string,
        birthDate: date,
        email: string,
        phone: string,
        password: string
    }
    ```
    - <u>Válasz:</u>\
        - Sikeres: **200-as státuszkód**, body-ban:
        ```javascript
        {
            userId: int,
            fullName: string,
            username: string,
            birthDate: date,
            email: string,
            phone: string
        }
        ```
        - Sikertelen: *TBD*

## Foglalási flow

### Foglalási/keresési képernyő

- Képernyőterv:\
<img src="markdown_images/design/foglalas_design.png" alt="foglalási form képernyő design" height=500/>

- Képernyő:\
<img src="markdown_images/views/booking_view.png" alt="foglalási form képernyő" height=500/>
<img src="markdown_images/views/booking_view_bottom.png" alt="foglalási form képernyő" height=500/>

- Backend érintettség:
    - <u>Végpont:</u> **GET /api/accommodations**
    - <u>Kérés:</u>\
    Body-ban:
    ```javascript
    {
        city: string,
        startDate: date,
        endDate: date,
        paymentMethod: PaymentMethod,
        priceFrom: int?,
        priceTo: int?,
        currency: Currency?,
        ratingFrom: float?,
        ratingTo: float?,
        nonSmoking: boolean,
        petFriendly: boolean,
        airConditioner: boolean,
        parking: boolean,
        bicycleStorage: boolean
    }

    PaymentMethod = 'CASH' | 'CARD'

    Currency = 'HUF' | 'EUR' | 'USD'
    ```

    - <u>Válasz:</u>
        - Sikeres: **200-as státuszkód**, body-ban:
        ```javascript
        {
            rooms: RoomResponse[]
        }

        RoomResponse = {
            id: int,
            address: string,
            geoLength: float,
            geoWidth: float,
            roomType: RoomType,
            price: float,
            currency: Currency,
            maxGuestNum: int,
            nonSmoking: boolean,
            petFriendly: boolean,
            airConditioner: boolean,
            parking: boolean,
            bicycleStorage: boolean,
            additionalInfo: string,
            bookings: BookingResponse[]
        }

        RoomType = 'APARTMENT' | 'ROOM' | 'COUCH'

        BookingResponse = {
            int: id,
            startDate: date,
            endDate: date,
            paymentMethod: PaymentMethod,
            approved: boolean,
            numOfGuests: int,
            additionalNotes: string,
            payWithChores: boolean,
            totalPrice: float
        }
        ```
        - Sikertelen: *TBD*

        - <u><b>Módosítás:</b></u> a RoomResponse-ba fel kell venni, hogy lehetséges-e házi munkával fizetni, és ha igen, akkor mennyi lesz az új ár.
    
### Szállás lista képernyő
- Képernyőterv:\
<img src="markdown_images/design/search_results_design.png" alt="szállások keresés lista képernyő design" height=500/>

- Képernyő:\
<img src="markdown_images/views/AccommListView.png" alt="szállások keresés lists képernyő" height=500/>

- Backend érintettség:
    - Az előző pontban a backend válaszának body-jában megkapott tömb elemei kerülnek megjelenítésre.

### Szállás képernyő

- Szállás adaitnak részletes megjelenítése + form elemek a foglalás leadásához.

- Képernyőterv: *TBD*

- Képernyő: *TBD*

- Backend érintettség:
    - **Kliens oldalon eltárolt state kerül felhasználásra a navigáció során**, nincs külön újabb végpont hívás a szállás adataiért. Abban az esetben, ha ezt nem lehet megvalósítani, kerül létrehozásra egy végpont, amely az adott szállás adait adja vissza.

    - <u>Kérés a foglalás adataival:</u> *TBD*

### Foglalás sikerességéhez tájékoztató képernyő

- Foglaláshoz tartozó adatok összesítésének megjelenítése.

- Képernyőterv: *TBD*

- Képernyő: *TBD*

## Kiadási flow

- Képernyőterv:\
<img src="markdown_images/design/kiadas_design.png" alt="szoba kiadáshoz tartozó képernyőnézet design" height=500/>

- Képernyő:\
<img src="markdown_images/views/renting_view.png" alt="szoba kiadáshoz tartozó képernyőnézet" height=500/>
<img src="markdown_images/views/renting_view_bottom.png" alt="szoba kiadáshoz tartozó képernyőnézet" height=500/>

- **Módosítás:** dropdown select-ben lehessen kiválasztani a pénznemet

- Backend érintettség:
    - <u>Végpont:</u> **POST /api/accommodations**
    - <u>Kérés:</u>\
    Body-ban:
    ```javascript
    {
        address: string,
        geoLength: float,
        geoWidth: float,
        roomType: RoomType,
        price: float,
        currency: Currency,
        maxGuestNum: int,
        nonSmoking: boolean,
        petFriendly: boolean,
        airConditioner: boolean,
        parking: boolean,
        bicycleStorage: boolean,
        additionalInfo: boolean,
        userId: int
    }
    ```
    - <u>Válasz:</u>
        - Sikeres: **201-es státuszkód** üres body-val
        - Sikertelen:
            - Nem megfelelő paraméter megadása esetén: **400-as státuszkód** üres body-val
            - Sikertelen kérés esetén: **404-es státuszkód** üres body-val

### Kiadás sikerességéhez tájékoztató képernyő

- Visszacsatolás a felhasználónak, hogy sikeresen meghirdette a szállást.

- Képernyőterv: *TBD*

- Képernyő: *TBD*

## Backend válasz kezelése - pending és error állapotok

### Általános loading képernyő

- Megjelenítendő képernyő miközben a kliens a backend válaszára vár

- Képernyőterv: *TBD*

- Képernyő: *TBD*

### Általános error képernyő

- Hibakódot tartalmazó backend válaszok esetén megjelenítendő általános hiba állapot kezelésére szolgáló képernyő

- Képernyőterv: *TBD*

- Képernyő: *TBD*

