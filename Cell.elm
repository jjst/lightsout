module Cell exposing (..)

import Html exposing (Html, div, section, figure, node)
import Html.Attributes exposing (style, id, class, rel, href)

import Html.App as App
import Html.Events exposing (onClick)


main =
    App.beginnerProgram
        { model = init On
        , update = update
        , view = view
        }

-- Model
type Light = On | Off

type alias Model = Light

init : Light -> Model
init l = l

-- Update
type Msg
    = Toggle

update : Msg -> Model -> Model
update message model =
    case model of
        On -> Off
        Off -> On


-- View

size = 100

view : Model -> Html Msg
view model =
    let
        lightClass =
            --case model of
            --    On -> "#FFFF99"
            --    Off -> "grey"
            case model of
                On -> ""
                Off -> "flipped"
        divStyle =
            style
                [ ("height", "95%")
                , ("width", "95%")
                , ("border-radius", "15px")
                ]
    in
       section [class "container", onClick Toggle ] 
               [ css "style.css"
               , div
                    [id "light", class lightClass]
                    [ figure [class "on"] []
                    , figure [class "off"] []
                    ]
               ]

css : String -> Html a
css path =
  node "link" [ rel "stylesheet", href path ] []
