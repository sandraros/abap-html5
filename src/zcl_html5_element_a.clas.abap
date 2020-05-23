"! <p class="shorttext synchronized" lang="en">Element</p>
CLASS zcl_html5_element_a DEFINITION
  INHERITING FROM zcl_html5_element_normal
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES: zif_html5_content_flow.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node
        href   TYPE csequence OPTIONAL.

    DATA: href TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.

    METHODS set_href
      IMPORTING
        href TYPE csequence.

ENDCLASS.



CLASS zcl_html5_element_a IMPLEMENTATION.


  METHOD constructor.

    super->constructor( parent = parent tag = 'a' ) ##NO_TEXT.
    set_href( href ).

  ENDMETHOD.


  METHOD set_href.

    me->href = href.

  ENDMETHOD.


ENDCLASS.
