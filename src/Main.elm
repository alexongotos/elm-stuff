module Main exposing (Model, Msg(..), main, update, view)

import Browser
import Card as C exposing (Card)
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }


type alias Model =
    { count : Int
    , cards : Card
    }


type Msg
    = Increment
    | Decrement
    | Reset
    | CardMsg C.Msg



-- test


type alias Deck =
    { id : Int
    , name : String
    }


type alias Category =
    { id : Int
    , name : String
    }


initialModel : Model
initialModel =
    Model 0 C.dummyCard


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | count = model.count + 1 }

        Decrement ->
            { model | count = model.count - 1 }

        Reset ->
            initialModel

        CardMsg cardmsg ->
            { model | cards = C.update cardmsg model.cards }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model.count) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "r" ]
        , div [] [ C.view CardMsg model.cards ]
        ]
