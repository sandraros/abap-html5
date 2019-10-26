"! <p class="shorttext synchronized" lang="en">Any XHTML element</p>
CLASS zcl_html5_element DEFINITION
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        tag TYPE csequence.
    METHODS render
      RETURNING
        VALUE(xhtml) TYPE string.
    DATA tag TYPE string READ-ONLY.
  PROTECTED SECTION.
    DATA: attributes  TYPE string,
          subelements TYPE STANDARD TABLE OF REF TO zcl_html5_element WITH EMPTY KEY.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_html5_element IMPLEMENTATION.


  METHOD constructor.

    me->tag = tag.

  ENDMETHOD.


  METHOD render.

    xhtml = xhtml &&
        |<{ tag }{ COND #( WHEN attributes IS NOT INITIAL THEN | { attributes }| ) }{
        COND #( WHEN subelements IS INITIAL
        THEN
            " <element attributes/>
            |/\n|
        ELSE
            " <element attributes><!--content--></element>
            |>{
            REDUCE #( INIT xhtml2 = `` FOR subelement IN subelements NEXT xhtml2 = xhtml2 && subelement->render( ) )
            }</{ tag }| )
        }>\n|.

  ENDMETHOD.


ENDCLASS.
