1. how to access the resource:
- Start local host by typing `rails s`.
- Access database through http://localhost:3000/coffee. This index page should show list of all coffee available in our current database.
2. how to filter by origin:
- Store all coffee in an array : 
```javascript
    all = Coffee.all.to_a
```
- Each coffee object looks like this:
```javascript
{
    "id": 2,
    "name": "Wake-up ",
    "notes": "dry, chewy, kiwi, brown sugar, lavender",
    "origin": "Mogiana, Brazil",
    "created_at": "2020-11-30T17:40:03.616Z",
    "updated_at": "2020-11-30T17:40:03.616Z"
}
```
- Grab coffee's origin by using 
```javascript
    origin_filter = params[:origin] || ""
```
- Create a filtered list : 
```javascript
    filtered = all.select { |coffee| coffee.origin.include? origin_filter }
```
3. how to how to limit to some number of results:
- Set a limit:
```javascript
    limit = (params[:limit] || 10).to_i
```
- Limit the amount of results:
```javascript
    chunks = filtered.each_slice(limit).to_a
```
4. how to specify which page of results
- Create a page params:
```javascript
    page = (params[:page] || 0).to_i
```
- To view different pages:
```javascript
    coffees = chunks[page]
```
