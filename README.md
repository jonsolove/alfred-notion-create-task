# Alfred <> Notion - Create Page

This Alfred workflow creates a page in Notion. I'm using it for creating tasks under my Task List, so the properties reflect that usage.

## Usage

Open the Alfred prompt and type the following:

`ntn CATEGORY;TITLE;BODY`

This creates a page (task) with the title and body mapped. I've also created a "Category" select property in my Task List.

## Example Usage

Open the Alfred prompt and type the following:

`ntn Home;Buy more BTC;Go on Gemini and buy a lot of Bitcoin`

That will create a page (task) in your selected database (database_id) with the title set to '[Home] Buy more BTC', the Category (custom field) set to 'Home', and the Body of the page set to 'Go on Gemini and buy a lot of Bitcoin'.

## Prerequisites

* Start by creating an integration here: <https://www.notion.so/my-integrations>
* The "api secret" you get from your integration will need to be put into the BEARER_TOKEN variable.
* Also make sure to "share" your database with your integration or it won't show up. For more info on working with databases in Notion, check this out: <https://developers.notion.com/docs/working-with-databases>
* Finally update the DATABASE_ID to match your database (found in the url if viewed from the browser)
