"! <p class="shorttext synchronized" lang="en">HTML body</p>
CLASS zcl_html5_element_body DEFINITION
  INHERITING FROM zcl_html5_element_normal
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        parent TYPE REF TO zcl_html5_node.

    METHODS add_a
      IMPORTING
        href          TYPE csequence OPTIONAL
      RETURNING
        VALUE(result) TYPE REF TO zcl_html5_element_a.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: body_elements TYPE STANDARD TABLE OF REF TO zif_html5_content_flow WITH EMPTY KEY.

ENDCLASS.



CLASS zcl_html5_element_body IMPLEMENTATION.


  METHOD constructor.

    super->constructor( tag = 'body' parent = parent ) ##NO_TEXT.

  ENDMETHOD.


  METHOD add_a.

    result = NEW #( parent = parent href = href ).
    APPEND result TO body_elements.

  ENDMETHOD.

ENDCLASS.
