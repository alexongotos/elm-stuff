module Card exposing (Card, Msg, dummyCard, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type Msg
    = Flip


main =
    Browser.sandbox
        { init = dummyCard
        , update = update
        , view = view identity
        }


update : Msg -> Card -> Card
update msg card =
    case msg of
        Flip ->
            { card | facing = turnOver card.facing }


type Face
    = Front
    | Back


type alias Card =
    { id : Int
    , deck_id : Int
    , front : String
    , back : String
    , facing : Face
    }


dummyCard : Card
dummyCard =
    Card 0 0 "the front" "the back" Front


turnOver : Face -> Face
turnOver from =
    case from of
        Front ->
            Back

        Back ->
            Front



--view : Card -> Html Msg


view wrapper card =
    div []
        [ button [ onClick <| wrapper Flip ] [ text "flip" ]
        , text <| faceText card
        ]


faceText card =
    case card.facing of
        Front ->
            card.front

        Back ->
            card.back
