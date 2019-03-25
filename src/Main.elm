import Element exposing (Element, Color, el, text, row, column, alignBottom, inFront, fill, width, rgb255, spacing, spaceEvenly, centerX, centerY, padding, paddingXY)
import Element.Background as Background
import Basics exposing (modBy)
import Element.Border as Border
import Element.Font as Font


main = 
    Element.layout []
        myRowOfStuff

myRowOfStuff : Element msg
myRowOfStuff =
    row [ width fill, centerY, spaceEvenly, padding 10 ]
        [ tower
        , tower
        , tower
        ]

towerBase : Element msg
towerBase =
    el
        [ Background.color (rgb255 0 0 0)
        , Border.rounded 5
        , paddingXY 70 10
        ]
        (text "")  -- TODO there must be a better way

towerPole : Element msg
towerPole =
    el
        [ Background.color (rgb255 0 0 0)
        , Border.roundEach { topLeft = 5, topRight = 5, bottomLeft = 0, bottomRight = 0 }
        , paddingXY 10 60
        , centerX
        ]
        (text "")  -- TODO there must be a better way

tower : Element msg
tower =
    column
        []
        [ el
              [ inFront (column [centerX, alignBottom] [disc 1, disc 2, disc 3, disc 4]), centerX ]
              towerPole
        , towerBase
        ]

disc : Int -> Element msg
disc n =
    el
        [ Background.color (discColor n)
        , Border.rounded 5
        , Border.solid
        , Border.width 1
        , paddingXY (10 * (n + 1)) 10
        , centerX
        ]
        (text "")  -- TODO there must be a better way

discColor : Int -> Color
discColor n =
    case modBy 4 n of
        0 -> rgb255 0 165 0
        1 -> rgb255 255 0 0
        2 -> rgb255 255 165 0
        3 -> rgb255 255 255 0
        _ -> rgb255 255 255 255 -- TODO make this terrible code impossible
