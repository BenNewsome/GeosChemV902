!$ID$
!------------------------------------------------------------------------------
!          Harvard University Atmospheric Chemistry Modeling Group            !
!------------------------------------------------------------------------------
!BOP
!
! !MODULE: gckpp_comode_mod
!
! !DESCRIPTION: Module GCKPP\_COMODE\_MOD is used to allocate
!               and deallocate arrays for the KPP solver. 
!\\
!\\
! !INTERFACE: 
!
MODULE GCKPP_COMODE_MOD
! 
! !USES:
!  
  IMPLICIT NONE

  REAL*8,  ALLOCATABLE :: R_KPP(:,:)
  REAL*8,  ALLOCATABLE :: HSAVE_KPP(:,:,:) 
  REAL*8,  ALLOCATABLE :: CSPEC_FOR_KPP(:,:) 
!    
! !REVISION HISTORY:
!   16 Sep 2009 - P. Le Sager - init
!EOP
!------------------------------------------------------------------------------
    
CONTAINS
  
!------------------------------------------------------------------------------
!          Harvard University Atmospheric Chemistry Modeling Group            !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: INIT_GCKPP_COMODE
!
! !DESCRIPTION: Subroutine INIT\_GCKPP\_COMODE is used to allocate
!               arrays for the KPP solver. 
!\\
!\\
! !INTERFACE:
!  
  SUBROUTINE INIT_GCKPP_COMODE( IIPAR, JJPAR, LLTROP, ITLOOP, NMTRATE, IGAS, RC )
!
! !INPUT PARAMETERS:
!    
    INTEGER, INTENT(IN) :: IIPAR, JJPAR, LLTROP, ITLOOP, NMTRATE, IGAS
!
! !OUTPUT PARAMETERS:
!    
    INTEGER, INTENT(OUT):: RC
!    
! !REVISION HISTORY:
!   16 Sep 2009 - P. Le Sager - init
!EOP
!------------------------------------------------------------------------------
!BOC
!
! !LOCAL VARIABLES:
!
    INTEGER :: AS

    RC=0

    WRITE( 6, 100 )
100 FORMAT( '     - INIT_GCKPP_COMODE: Allocating arrays for GCKPP...' )


    ALLOCATE( R_KPP( ITLOOP, NMTRATE ), STAT=AS )
    IF ( AS /= 0 ) THEN
       RC=1
       RETURN
    ENDIF
    R_KPP = 0d0

    ALLOCATE( HSAVE_KPP( IIPAR, JJPAR, LLTROP ), STAT=AS )
    IF ( AS /= 0 ) THEN
       RC=1
       RETURN
    ENDIF
    HSAVE_KPP = 0.d0 

    ALLOCATE( CSPEC_FOR_KPP( ITLOOP, IGAS ), STAT=AS )
    IF ( AS /= 0 ) THEN
       RC=1
       RETURN
    ENDIF
    CSPEC_FOR_KPP = 0d0

    ! Return to calling program
  END SUBROUTINE INIT_GCKPP_COMODE
!EOC
!  
!------------------------------------------------------------------------------
!          Harvard University Atmospheric Chemistry Modeling Group            !
!------------------------------------------------------------------------------
!BOP
!
! !IROUTINE: CLEANUP_GCKPP_COMODE
!
! !DESCRIPTION: Subroutine CLEANUP\_GCKPP\_COMODE is used to deallocate
!               arrays for the KPP solver. 
!\\
!\\
! !INTERFACE:
!    
  SUBROUTINE CLEANUP_GCKPP_COMODE
!    
! !REVISION HISTORY:
!   16 Sep 2009 - P. Le Sager - init
!EOP
!------------------------------------------------------------------------------
!BOC    
    IF ( ALLOCATED( R_KPP         ) ) DEALLOCATE( R_KPP         )
    IF ( ALLOCATED( CSPEC_FOR_KPP ) ) DEALLOCATE( CSPEC_FOR_KPP )
    IF ( ALLOCATED( HSAVE_KPP     ) ) DEALLOCATE( HSAVE_KPP     )

    ! Return to calling program
  END SUBROUTINE CLEANUP_GCKPP_COMODE
!EOC
  
END MODULE GCKPP_COMODE_MOD
