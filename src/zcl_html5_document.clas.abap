"! <p class="shorttext synchronized" lang="en">Document</p>
CLASS zcl_html5_document DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS constructor
      IMPORTING
        doctype_legacy_string TYPE abap_bool DEFAULT abap_false.

    METHODS render
      RETURNING
        VALUE(result) TYPE string.

    DATA: global_attributes TYPE REF TO zcl_html5_global_attributes READ-ONLY.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA: doctype_legacy_string TYPE abap_bool,
          elements              TYPE STANDARD TABLE OF REF TO zcl_html5_element.

ENDCLASS.



CLASS zcl_html5_document IMPLEMENTATION.


  METHOD constructor.

    me->doctype_legacy_string = doctype_legacy_string.
    global_attributes = NEW #( ).

  ENDMETHOD.


  METHOD render.

    " EITHER <!DOCTYPE html>
    " OR     <!DOCTYPE html SYSTEM "about:legacy-compat">
    result =
        |<!DOCTYPE html{
        COND #( WHEN doctype_legacy_string = abap_true THEN ' SYSTEM "about:legacy-compat"' ) }>\n{
        REDUCE #( INIT xhtml = `` FOR element IN elements NEXT xhtml = xhtml && element->render( ) ) }|.

  ENDMETHOD.


ENDCLASS.
