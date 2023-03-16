CLASS lhc_Booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateTotalFlightPrice FOR DETERMINE ON MODIFY
          IMPORTING keys FOR Booking~calculateTotalFlightPrice.

    METHODS validateStatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR Booking~validateStatus.

ENDCLASS.

CLASS lhc_Booking IMPLEMENTATION.

  METHOD calculateTotalFlightPrice .
  ENDMETHOD.

  METHOD validateStatus.

    READ ENTITY z_i_travel2914\\Booking
    FIELDS ( BookingStatus )
    WITH VALUE #( FOR  <row_key> IN keys ( %key = <row_key>-%key ) )
    RESULT DATA(lt_booking_result).
    LOOP AT lt_booking_result INTO DATA(ls_booking_result).

      CASE ls_booking_result-BookingStatus.
        WHEN 'N'.
        WHEN 'B'.
        WHEN 'X'.
        WHEN OTHERS.
          APPEND VALUE #( %key = ls_booking_result-%key ) TO failed-booking.
          APPEND VALUE #( %key = ls_booking_result-%key
                          %msg = new_message( id = 'Z_MC_TRAVEL2914'
                                               number = '007'
                                               v1 = ls_booking_result-BookingId
                                               severity = if_abap_behv_message=>severity-error )
                          %element-BookingStatus = if_abap_behv=>mk-on
                          ) TO reported-booking.

      ENDCASE.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
