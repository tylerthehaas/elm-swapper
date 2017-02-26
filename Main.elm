module Main exposing (..)

import Html exposing (..)


-- MODEL


type alias Model =
    { availableFlavors : List String
    , likedFlavors : List String
    }


initialModel : Model
initialModel =
    { availableFlavors =
        [ "butter pecan"
        , "chocolate"
        , "chocolate chip"
        , "chocolate mint"
        , "cookie dough"
        , "neapolitan"
        , "rainbow sherbet"
        , "raspberry"
        , "strawberry"
        , "vanilla"
        ]
    , likedFlavors = []
    }



-- MESSAGES


type Msg
    = NoOp



-- VIEW


view : Model -> Html Msg
view model =
    div [] []



--UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
