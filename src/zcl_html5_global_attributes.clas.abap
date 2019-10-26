"! <p class="shorttext synchronized" lang="en">Global attributes</p>
CLASS zcl_html5_global_attributes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: ty_access_key  TYPE c LENGTH 1,
           ty_access_keys TYPE STANDARD TABLE OF ty_access_key WITH EMPTY KEY.

    METHODS set_access_key
      IMPORTING
        access_keys TYPE ty_access_keys.

    DATA: access_keys TYPE ty_access_keys READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_html5_global_attributes IMPLEMENTATION.


  METHOD set_access_key.
    me->access_keys = access_keys.
  ENDMETHOD.


ENDCLASS.
