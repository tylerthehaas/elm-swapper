module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, disabled, size, value)
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
    | MoveRight String
    | MoveLeft String



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "App" ]
        [ h1 [] [ text "Favorite Ice Cream Flavors" ]
        , swapper model
        ]


swapper : Model -> Html Msg
swapper model =
    div
        [ class "swapper" ]
        [ select_ model.availableFlavors OnRightSelect (List.length model.availableFlavors) model.rightSelected
        , div [ class "buttons" ]
            [ button [ disabled (String.isEmpty model.rightSelected) ] [ text "⇨" ]
            , button [ disabled (String.isEmpty model.leftSelected) ] [ text "⇦" ]
            ]
        , select_ model.likedFlavors OnLeftSelect (List.length model.availableFlavors) model.leftSelected
          -- , div [] [ text (toString model) ]
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

        MoveRight str ->
            { model
                | likedFlavors = str :: model.likedFlavors
                , availableFlavors = List.filter (\flavor -> str /= flavor) model.availableFlavors
            }

        MoveLeft str ->
            { model
                | availableFlavors = str :: model.availableFlavors
                , likedFlavors = List.filter (\flavor -> str /= flavor) model.likedFlavors
            }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
