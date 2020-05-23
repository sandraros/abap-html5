"! <p class="shorttext synchronized" lang="en">Any HTML5 element</p>
CLASS zcl_html5_element DEFINITION
  INHERITING FROM zcl_html5_node
  ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node
        tag TYPE csequence.

    METHODS render REDEFINITION.

    DATA: tag               TYPE string READ-ONLY,
          global_attributes TYPE REF TO zcl_html5_global_attributes READ-ONLY.

  PROTECTED SECTION.

    DATA: attributes TYPE string.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_html5_element IMPLEMENTATION.


  METHOD constructor.

    super->constructor( parent = parent ).
    me->tag = tag.
    global_attributes = NEW #( ).

  ENDMETHOD.


  METHOD render.

    result =
        |<{ tag }{ COND #( WHEN attributes IS NOT INITIAL THEN | { attributes }| ) }{
        COND #( WHEN children IS INITIAL
        THEN
            " <element attributes/>
            |/\n|
        ELSE
            " <element attributes><!--content--></element>
            |>{
            REDUCE #( INIT html5 = `` FOR child IN children NEXT html5 = html5 && child->render( ) )
            }</{ tag }| )
        }>\n|.

  ENDMETHOD.


ENDCLASS.
