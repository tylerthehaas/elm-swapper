module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (size, value)
import Html.Events exposing (onInput)


-- MODEL


type alias Model =
    { availableFlavors : List String
    , likedFlavors : List String
    , rightSelected : String
    , leftSelected : String
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
    , rightSelected = ""
    , leftSelected = ""
    }



-- MESSAGES


type Msg
    = OnRightSelect String
    | OnLeftSelect String



-- VIEW


view : Model -> Html Msg
view model =
    div
        []
        [ select_ model.availableFlavors OnRightSelect (List.length model.availableFlavors) model.rightSelected
        ]


select_ : List String -> (String -> msg) -> Int -> String -> Html msg
select_ items onSelect size_ value_ =
    select [ onInput onSelect, size size_, value value_ ]
        (List.map (\flavor -> option [] [ text flavor ]) items)



--UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        OnRightSelect str ->
            { model | rightSelected = str }

        OnLeftSelect str ->
            { model | leftSelected = str }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
