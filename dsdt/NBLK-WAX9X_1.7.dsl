/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Sun Nov 15 19:30:44 2020
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00008E22 (36386)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x12
 *     OEM ID           "HUAWEI"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "ACPI"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "DSDT", 1, "HUAWEI", "EDK2    ", 0x00000002)
{
    /*
     * iASL Warning: There were 10 external control methods found during
     * disassembly, but only 0 were resolved (10 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_PR_.C000.PPCV, UnknownObj)
    External (_PR_.C001.PPCV, UnknownObj)
    External (_PR_.C002.PPCV, UnknownObj)
    External (_PR_.C003.PPCV, UnknownObj)
    External (_PR_.C004.PPCV, UnknownObj)
    External (_PR_.C005.PPCV, UnknownObj)
    External (_PR_.C006.PPCV, UnknownObj)
    External (_PR_.C007.PPCV, UnknownObj)
    External (_SB_.APTS, MethodObj)    // Warning: Unknown method, guessing 3 arguments
    External (_SB_.AWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.TPM2.PTS_, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.UBTC, UnknownObj)
    External (_SB_.UBTC.M318, MethodObj)    // Warning: Unknown method, guessing 0 arguments
    External (_SB_.WMI1, UnknownObj)
    External (_SB_.WMI1.WMEN, UnknownObj)
    External (AFN4, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN7, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (ALIB, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (AUEN, IntObj)
    External (BTEN, IntObj)
    External (CAEN, IntObj)
    External (DAIN, UnknownObj)
    External (DAOU, IntObj)
    External (FPEN, IntObj)
    External (HDEN, IntObj)
    External (KSVA, IntObj)
    External (M009, UnknownObj)
    External (M010, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (MPTS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (MWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (OSAR, IntObj)
    External (OWUS, IntObj)
    External (PDEN, IntObj)
    External (SEBO, IntObj)
    External (TPCM, IntObj)
    External (UBTC, UnknownObj)
    External (UPEN, IntObj)
    External (VTEN, IntObj)
    External (WFEN, IntObj)
    External (WMI1, UnknownObj)

    Scope (_SB)
    {
        OperationRegion (ECMS, SystemIO, 0x72, 0x02)
        Field (ECMS, ByteAcc, Lock, Preserve)
        {
            EIND,   8, 
            EDAT,   8
        }

        IndexField (EIND, EDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF0), 
            DC1H,   8, 
            DC1L,   8, 
            DC2H,   8, 
            DC2L,   8, 
            DCT1,   8, 
            DCT2,   8, 
            DCT3,   8, 
            DCT4,   8
        }

        IndexField (EIND, EDAT, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF0), 
            CPO1,   16, 
            CPO2,   16, 
            CTMS,   32, 
            LPO1,   16, 
            LPO2,   16, 
            LTMS,   32
        }
    }

    Method (DCTC, 1, Serialized)
    {
        \_SB.DC2H = \_SB.DC1H
        \_SB.DC2L = \_SB.DC1L
        \_SB.DC1H = ((Arg0 & 0xFF00) >> 0x08)
        \_SB.DC1L = (Arg0 & 0xFF)
    }

    OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (HSMI, 0, NotSerialized)
    {
        SSMP = 0xC1
    }

    Method (NSMI, 0, NotSerialized)
    {
        SSMP = 0xC5
    }

    Method (GVER, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, BMJV)
        CreateByteField (BUFF, 0x03, BMNV)
        STAT = Zero
        BMJV = One
        BMNV = 0x0A
        Return (BUFF) /* \GVER.BUFF */
    }

    Method (GTSI, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, TSI1)
        CreateByteField (BUFF, 0x02, TSI2)
        STAT = Zero
        TSI1 = 0xA1
        TSI2 = 0x49
        Return (BUFF) /* \GTSI.BUFF */
    }

    Method (GTMP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, TEPE)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, TEM0)
        CreateByteField (BUFF, 0x02, TEM1)
        CreateByteField (BUFF, 0x03, TEM2)
        STAT = Zero
        If ((TEPE == Zero))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.CTMP
        }
        ElseIf ((TEPE == 0x05))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.TSLO
        }
        ElseIf ((TEPE == 0x07))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.TNTC
        }
        ElseIf ((TEPE == 0x08))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.CNTC
        }
        ElseIf ((TEPE == 0x0B))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.DNTC
        }
        ElseIf ((TEPE == 0x0E))
        {
            Local1 = \_SB.PCI0.LPC0.EC0.BTMP
        }
        Else
        {
            Local1 = 0xFF
        }

        If ((Local1 == 0xFF))
        {
            STAT = One
        }

        TEM1 = Local1
        TEM0 = Zero
        TEM2 = Zero
        Return (BUFF) /* \GTMP.BUFF */
    }

    Method (STMT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, SSRN)
        CreateByteField (Arg0, 0x05, TUPL)
        CreateByteField (Arg0, 0x07, TDNL)
        Local1 = Zero
        If ((TDNL > TUPL))
        {
            Local1 = 0xFF
        }

        If ((Local1 == Zero))
        {
            If ((SSRN == Zero))
            {
                \_SB.PCI0.LPC0.EC0.UCPU = TUPL /* \STMT.TUPL */
                \_SB.PCI0.LPC0.EC0.DCPU = TDNL /* \STMT.TDNL */
                \_SB.PCI0.LPC0.EC0.CPUF = Zero
                \_SB.PCI0.LPC0.EC0.CPDF = Zero
                \_SB.PCI0.LPC0.EC0.TFUC = Zero
                \_SB.PCI0.LPC0.EC0.TFDC = Zero
            }
            ElseIf ((SSRN == 0x05))
            {
                \_SB.PCI0.LPC0.EC0.UGPE = TUPL /* \STMT.TUPL */
                \_SB.PCI0.LPC0.EC0.DGPE = TDNL /* \STMT.TDNL */
                \_SB.PCI0.LPC0.EC0.GPUF = Zero
                \_SB.PCI0.LPC0.EC0.GPDF = Zero
                \_SB.PCI0.LPC0.EC0.TFUG = Zero
                \_SB.PCI0.LPC0.EC0.TFDG = Zero
            }
            ElseIf ((SSRN == 0x07))
            {
                \_SB.PCI0.LPC0.EC0.UTYC = TUPL /* \STMT.TUPL */
                \_SB.PCI0.LPC0.EC0.DTYC = TDNL /* \STMT.TDNL */
                \_SB.PCI0.LPC0.EC0.TCUF = Zero
                \_SB.PCI0.LPC0.EC0.TCDF = Zero
                \_SB.PCI0.LPC0.EC0.TFUT = Zero
                \_SB.PCI0.LPC0.EC0.TFDT = Zero
            }
            ElseIf ((SSRN == 0x08))
            {
                \_SB.PCI0.LPC0.EC0.UCHA = TUPL /* \STMT.TUPL */
                \_SB.PCI0.LPC0.EC0.DCHA = TDNL /* \STMT.TDNL */
                \_SB.PCI0.LPC0.EC0.CHUF = Zero
                \_SB.PCI0.LPC0.EC0.CHDF = Zero
                \_SB.PCI0.LPC0.EC0.TFUH = Zero
                \_SB.PCI0.LPC0.EC0.TFDH = Zero
            }
            ElseIf ((SSRN == 0x0B))
            {
                \_SB.PCI0.LPC0.EC0.UDDR = TUPL /* \STMT.TUPL */
                \_SB.PCI0.LPC0.EC0.DDDR = TDNL /* \STMT.TDNL */
                \_SB.PCI0.LPC0.EC0.DRUF = Zero
                \_SB.PCI0.LPC0.EC0.DRDF = Zero
                \_SB.PCI0.LPC0.EC0.TFUD = Zero
                \_SB.PCI0.LPC0.EC0.TFDD = Zero
            }

            STAT = Zero
        }
        Else
        {
            STAT = One
        }

        Return (BUFF) /* \STMT.BUFF */
    }

    Method (GPSI, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, PSIT)
        PSIT = 0x05
        STAT = Zero
        Return (BUFF) /* \GPSI.BUFF */
    }

    Method (GPCI, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Name (IADP, Zero)
        Name (IBAT, Zero)
        Name (VBAT, Zero)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, POVA)
        CreateByteField (Arg0, 0x02, GTST)
        STAT = Zero
        Switch (ToInteger (GTST))
        {
            Case (Zero)
            {
                Local1 = Zero
                IADP = \_SB.PCI0.LPC0.EC0.PADH
                IADP <<= 0x08
                IADP |= \_SB.PCI0.LPC0.EC0.PADL /* \GPCI.IADP */
                Local1 = (IADP * 0x023A)
                Local1 /= 0x07D0
                POVA = Local1
            }
            Case (0x02)
            {
                Local1 = Zero
                IBAT = \_SB.PCI0.LPC0.EC0.PBTH
                IBAT <<= 0x08
                IBAT |= \_SB.PCI0.LPC0.EC0.PBTL /* \GPCI.IBAT */
                VBAT = \_SB.PCI0.LPC0.EC0.BT1V
                IBAT *= 0x0F
                Local1 = (IBAT * VBAT) /* \GPCI.VBAT */
                Local1 /= 0x000F4240
                POVA = Local1
            }
            Default
            {
                POVA = Zero
                STAT = One
            }

        }

        If ((POVA == Zero))
        {
            STAT = One
        }

        Return (BUFF) /* \GPCI.BUFF */
    }

    Method (GLIV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Name (CONT, Zero)
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, SURV)
        CreateByteField (BUFF, 0x02, KBBL)
        CONT = Zero
        Acquire (\_SB.PCI0.LPC0.EC0.ECMT, 0x03E8)
        \_SB.PCI0.LPC0.EC0.ECM3 (0xC4)
        While (((CONT != 0x0A) && ((\_SB.PCI0.LPC0.EC0.ECXC & One) == Zero)))
        {
            CONT += One
            Sleep (0x32)
        }

        KBBL = \_SB.PCI0.LPC0.EC0.ECXD
        Release (\_SB.PCI0.LPC0.EC0.ECMT)
        STAT = Zero
        Return (BUFF) /* \GLIV.BUFF */
    }

    Method (SLIV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, KBBV)
        CreateByteField (BUFF, Zero, STAT)
        Acquire (\_SB.PCI0.LPC0.EC0.ECMT, 0x03E8)
        If ((((KBBV == 0x04) || (KBBV == 0x08)) || (KBBV == 0x10)))
        {
            \_SB.PCI0.LPC0.EC0.ECM3 (0xC5)
            \_SB.PCI0.LPC0.EC0.ECD3 (KBBV)
            STAT = Zero
        }
        Else
        {
            STAT = One
        }

        Release (\_SB.PCI0.LPC0.EC0.ECMT)
        Return (BUFF) /* \SLIV.BUFF */
    }

    Method (GFNS, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, FANN)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, FANL)
        CreateByteField (BUFF, 0x02, FANH)
        STAT = Zero
        Switch (ToInteger (FANN))
        {
            Case (Zero)
            {
                FANH = \_SB.PCI0.LPC0.EC0.FRHI
                FANL = \_SB.PCI0.LPC0.EC0.FRLO
            }
            Case (One)
            {
                FANH = \_SB.PCI0.LPC0.EC0.F2HI
                FANL = \_SB.PCI0.LPC0.EC0.F2LO
            }
            Case (0x02)
            {
            }
            Case (0x03)
            {
            }
            Default
            {
                FANH = Zero
                FANL = Zero
            }

        }

        Return (BUFF) /* \GFNS.BUFF */
    }

    Method (GCVA, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Name (BCVF, Zero)
        Name (BCVT, Zero)
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, GCV1)
        CreateWordField (BUFF, 0x02, GCV2)
        CreateByteField (Arg0, 0x02, GCIN)
        STAT = Zero
        Switch (ToInteger (GCIN))
        {
            Case (0x20)
            {
                GCV1 = Zero
                GCV2 = \_SB.PCI0.LPC0.EC0.BT1V
            }
            Case (0x30)
            {
                Local1 = Zero
                BCVF = \_SB.PCI0.LPC0.EC0.BT1I
                If ((BCVF >= 0x8000))
                {
                    GCV1 = One
                    BCVT = ~BCVF /* \GCVA.BCVF */
                    GCV2 = (BCVT + One)
                }
                Else
                {
                    GCV1 = Zero
                    GCV2 = BCVF /* \GCVA.BCVF */
                }
            }
            Default
            {
                GCV1 = Zero
                GCV2 = Zero
                STAT = One
            }

        }

        Return (BUFF) /* \GCVA.BUFF */
    }

    Method (GCPL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GCPL.BUFF */
    }

    Method (SPLV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \SPLV.BUFF */
    }

    Method (GODP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GODP.BUFF */
    }

    Method (SODP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SODP.BUFF */
    }

    Method (SBTT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, BCLB)
        CreateByteField (Arg0, 0x03, BCHB)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        \_SB.PCI0.LPC0.EC0.BCCL = BCLB /* \SBTT.BCLB */
        \_SB.PCI0.LPC0.EC0.BCCH = BCHB /* \SBTT.BCHB */
        Return (BUFF) /* \SBTT.BUFF */
    }

    Method (GBTT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, GLCP)
        CreateByteField (BUFF, 0x02, GHCP)
        STAT = Zero
        GLCP = \_SB.PCI0.LPC0.EC0.BCCL
        GHCP = \_SB.PCI0.LPC0.EC0.BCCH
        Return (BUFF) /* \GBTT.BUFF */
    }

    Method (PAFS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, PAFS)
        STAT = Zero
        If ((\_SB.PCI0.LPC0.EC0.LPBF == One))
        {
            PAFS = One
        }
        Else
        {
            PAFS = 0x02
        }

        Return (BUFF) /* \PAFS.BUFF */
    }

    Method (PAFF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, PAFR)
        STAT = Zero
        If ((PAFR == One))
        {
            \_SB.PCI0.LPC0.EC0.LPBF = One
        }
        Else
        {
            \_SB.PCI0.LPC0.EC0.LPBF = Zero
        }

        Return (BUFF) /* \PAFF.BUFF */
    }

    Method (GFRS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, RELT)
        STAT = Zero
        RELT = 0x02
        If ((\_SB.PCI0.LPC0.EC0.FNIS == Zero))
        {
            RELT = One
        }

        Return (BUFF) /* \GFRS.BUFF */
    }

    Method (SFRS, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Name (RELT, Zero)
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, SFNM)
        STAT = Zero
        Switch (ToInteger (SFNM))
        {
            Case (One)
            {
                RELT = Zero
                \_SB.PCI0.LPC0.EC0.FNIS = RELT /* \SFRS.RELT */
            }
            Case (0x02)
            {
                RELT = One
                \_SB.PCI0.LPC0.EC0.FNIS = RELT /* \SFRS.RELT */
            }
            Default
            {
                STAT = One
            }

        }

        WRCM (0x61, RELT)
        Return (BUFF) /* \SFRS.BUFF */
    }

    Method (SPDT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, SPDT)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        \_SB.PCI0.LPC0.EC0.SPDT = SPDT /* \SPDT.SPDT */
        Return (BUFF) /* \SPDT.BUFF */
    }

    Method (RPDT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, GPDT)
        STAT = Zero
        GPDT = \_SB.PCI0.LPC0.EC0.SPDT
        Return (BUFF) /* \RPDT.BUFF */
    }

    Method (RPPT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, RPPT)
        STAT = Zero
        RPPT = \_SB.PCI0.LPC0.EC0.GPPT
        \_SB.PCI0.LPC0.EC0.GPPT = Zero
        Return (BUFF) /* \RPPT.BUFF */
    }

    Method (SMLS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, SMLR)
        STAT = Zero
        If ((SMLR == One))
        {
            \_SB.PCI0.LPC0.EC0.MICL = One
        }
        Else
        {
            \_SB.PCI0.LPC0.EC0.MICL = Zero
        }

        Return (BUFF) /* \SMLS.BUFF */
    }

    Method (GFNM, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GFNM.BUFF */
    }

    Method (SFNM, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SFNM.BUFF */
    }

    Method (GTUB, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GTUB.BUFF */
    }

    Method (STUB, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \STUB.BUFF */
    }

    Method (GSTP, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, GSII)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, GSIS)
        STAT = Zero
        DAIN = ToInteger (Local0)
        BUFF = DAOU /* External reference */
        Switch (ToInteger (GSII))
        {
            Case (Zero)
            {
                GSIS = SEBO /* External reference */
            }
            Case (0x10)
            {
                GSIS = TPCM /* External reference */
            }
            Case (0x20)
            {
                GSIS = UPEN /* External reference */
            }
            Case (0x21)
            {
                GSIS = HDEN /* External reference */
            }
            Case (0x22)
            {
                GSIS = PDEN /* External reference */
            }
            Case (0x23)
            {
                GSIS = CAEN /* External reference */
            }
            Case (0x24)
            {
                GSIS = AUEN /* External reference */
            }
            Case (0x25)
            {
                GSIS = WFEN /* External reference */
            }
            Case (0x26)
            {
                GSIS = BTEN /* External reference */
            }
            Case (0x27)
            {
                GSIS = FPEN /* External reference */
            }
            Case (0x2C)
            {
                GSIS = VTEN /* External reference */
            }
            Case (0x30)
            {
                GSIS = KSVA /* External reference */
            }
            Case (0x40)
            {
                GSIS = OWUS /* External reference */
            }
            Case (0x41)
            {
                GSIS = OSAR /* External reference */
            }
            Case (0x50)
            {
                HSMI ()
                BUFF = DAOU /* External reference */
            }
            Case (0xDF)
            {
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \GSTP.BUFF */
    }

    Method (SSTP, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, SSII)
        CreateByteField (Arg0, 0x03, SSIS)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = ToInteger (Local0)
        BUFF = DAOU /* External reference */
        Switch (ToInteger (SSII))
        {
            Case (Zero)
            {
                If ((SSIS == One))
                {
                    SEBO = One
                }
                ElseIf ((SSIS == Zero))
                {
                    SEBO = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x10)
            {
                If ((SSIS == One))
                {
                    TPCM = One
                }
                ElseIf ((SSIS == Zero))
                {
                    TPCM = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x20)
            {
                If ((SSIS == One))
                {
                    UPEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    UPEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x21)
            {
                If ((SSIS == One))
                {
                    HDEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    HDEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x22)
            {
                If ((SSIS == One))
                {
                    PDEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    PDEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x23)
            {
                If ((SSIS == One))
                {
                    CAEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    CAEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x24)
            {
                If ((SSIS == One))
                {
                    AUEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    AUEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x25)
            {
                If ((SSIS == One))
                {
                    WFEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    WFEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x26)
            {
                If ((SSIS == One))
                {
                    BTEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    BTEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x27)
            {
                If ((SSIS == One))
                {
                    FPEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    FPEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x2C)
            {
                If ((SSIS == One))
                {
                    VTEN = One
                }
                ElseIf ((SSIS == Zero))
                {
                    VTEN = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x30)
            {
                If ((SSIS == One))
                {
                    KSVA = One
                }
                ElseIf ((SSIS == Zero))
                {
                    KSVA = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x40)
            {
                If ((SSIS == One))
                {
                    OWUS = One
                }
                ElseIf ((SSIS == Zero))
                {
                    OWUS = Zero
                }
                Else
                {
                    STAT = One
                }
            }
            Case (0x41)
            {
                If (SSIS)
                {
                    OSAR = One
                }
                Else
                {
                    OSAR = Zero
                }
            }
            Case (0x50)
            {
                Switch (ToInteger (SSIS))
                {
                    Case (Zero)
                    {
                    }
                    Case (One)
                    {
                    }
                    Case (0x02)
                    {
                    }
                    Case (0x03)
                    {
                    }
                    Case (0x04)
                    {
                    }
                    Case (0x05)
                    {
                    }
                    Default
                    {
                        STAT = One
                    }

                }
            }
            Case (0xDF)
            {
                WRCM (0x69, 0xDF)
            }
            Default
            {
                STAT = One
            }

        }

        HSMI ()
        Return (BUFF) /* \SSTP.BUFF */
    }

    Method (SLGO, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = ToInteger (Local0)
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SLGO.BUFF */
    }

    Method (GLGO, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = ToInteger (Local0)
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GLGO.BUFF */
    }

    Method (GLOG, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, BY01)
        CreateByteField (BUFF, 0x03, BY03)
        CreateByteField (BUFF, 0x0D, BY13)
        CreateByteField (BUFF, 0x17, BY23)
        CreateByteField (BUFF, 0x20, BY32)
        CreateByteField (BUFF, 0x29, BY41)
        CreateByteField (BUFF, 0x32, BY50)
        CreateByteField (BUFF, 0x3B, BY59)
        CreateByteField (BUFF, 0x44, BY68)
        CreateByteField (BUFF, 0x4D, BY77)
        CreateByteField (BUFF, 0x56, BY86)
        BY01 = 0xB0
        BY03 = 0xB1
        BY13 = 0xB1
        BY23 = 0xE0
        BY32 = 0xE0
        BY41 = 0xE0
        BY50 = 0xE0
        BY59 = 0xE1
        BY68 = 0xE1
        BY77 = 0xE1
        BY86 = 0xE1
        CreateByteField (BUFF, 0x02, BY02)
        BY02 = \_SB.STCO
        CreateByteField (BUFF, 0x04, BY04)
        CreateByteField (BUFF, 0x0E, BY14)
        CreateByteField (BUFF, 0x18, BY24)
        CreateByteField (BUFF, 0x21, BY33)
        CreateByteField (BUFF, 0x2A, BY42)
        CreateByteField (BUFF, 0x33, BY51)
        CreateByteField (BUFF, 0x3C, BY60)
        CreateByteField (BUFF, 0x45, BY69)
        CreateByteField (BUFF, 0x4E, BY78)
        CreateByteField (BUFF, 0x57, BY87)
        BY04 = 0xEE
        If ((\_SB.CPO1 == 0xE410))
        {
            BY04 = 0xCC
        }

        If ((\_SB.CPO1 == 0xA810))
        {
            BY04 = 0xCC
        }

        If ((\_SB.CPO1 == 0xE310))
        {
            BY04 = 0xCC
        }

        BY14 = 0xEE
        If ((\_SB.LPO1 == 0x5410))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == 0x5510))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == Zero))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == 0x2900))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == 0x5200))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == 0x1B00))
        {
            BY14 = 0xCC
        }

        If ((\_SB.LPO1 == 0x2700))
        {
            BY14 = 0xCC
        }

        BY24 = 0xEE
        If ((\_SB.PCI0.LPC0.EC0.SDC3 == One))
        {
            BY24 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x03))
        {
            BY24 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x04))
        {
            BY24 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x12))
        {
            BY24 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x13))
        {
            BY24 = 0xCC
        }

        BY33 = 0xEE
        If ((\_SB.PCI0.LPC0.EC0.SDC2 == One))
        {
            BY33 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x03))
        {
            BY33 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x04))
        {
            BY33 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x12))
        {
            BY33 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x13))
        {
            BY33 = 0xCC
        }

        BY42 = 0xEE
        If ((\_SB.PCI0.LPC0.EC0.SDC1 == One))
        {
            BY42 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x03))
        {
            BY42 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x04))
        {
            BY42 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x12))
        {
            BY42 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x13))
        {
            BY42 = 0xCC
        }

        BY51 = 0xEE
        If ((\_SB.PCI0.LPC0.EC0.SDC0 == One))
        {
            BY51 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x03))
        {
            BY51 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x04))
        {
            BY51 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x12))
        {
            BY51 = 0xCC
        }

        If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x13))
        {
            BY51 = 0xCC
        }

        BY60 = 0xCC
        BY69 = 0xCC
        BY78 = 0xCC
        BY87 = 0xCC
        CreateWordField (BUFF, 0x05, BY05)
        CreateWordField (BUFF, 0x07, BY07)
        CreateDWordField (BUFF, 0x09, BY09)
        CreateWordField (BUFF, 0x0F, BY15)
        CreateWordField (BUFF, 0x11, BY17)
        CreateDWordField (BUFF, 0x13, BY19)
        BY05 = \_SB.CPO1
        BY07 = \_SB.CPO2
        BY09 = \_SB.CTMS
        BY15 = \_SB.LPO1
        BY17 = \_SB.LPO2
        BY19 = \_SB.LTMS
        CreateByteField (BUFF, 0x1B, BY27)
        CreateByteField (BUFF, 0x24, BY36)
        CreateByteField (BUFF, 0x2D, BY45)
        CreateByteField (BUFF, 0x36, BY54)
        CreateWordField (BUFF, 0x3E, BY62)
        CreateWordField (BUFF, 0x47, BY71)
        CreateWordField (BUFF, 0x50, BY80)
        CreateWordField (BUFF, 0x59, BY89)
        BY27 = 0xFF
        BY36 = 0xFF
        BY45 = 0xFF
        BY54 = 0xFF
        BY62 = 0xFFFF
        BY71 = 0xFFFF
        BY80 = 0xFFFF
        BY89 = 0xFFFF
        CreateByteField (BUFF, 0x19, BY25)
        CreateByteField (BUFF, 0x22, BY34)
        CreateByteField (BUFF, 0x2B, BY43)
        CreateByteField (BUFF, 0x34, BY52)
        BY25 = \_SB.PCI0.LPC0.EC0.SDC3
        BY34 = \_SB.PCI0.LPC0.EC0.SDC2
        BY43 = \_SB.PCI0.LPC0.EC0.SDC1
        BY52 = \_SB.PCI0.LPC0.EC0.SDC0
        CreateByteField (BUFF, 0x1A, BY26)
        CreateByteField (BUFF, 0x23, BY35)
        CreateByteField (BUFF, 0x2C, BY44)
        CreateByteField (BUFF, 0x35, BY53)
        BY26 = \_SB.PCI0.LPC0.EC0.SDV3
        BY35 = \_SB.PCI0.LPC0.EC0.SDV2
        BY44 = \_SB.PCI0.LPC0.EC0.SDV1
        BY53 = \_SB.PCI0.LPC0.EC0.SDV0
        CreateDWordField (BUFF, 0x1C, BY28)
        CreateDWordField (BUFF, 0x25, BY37)
        CreateDWordField (BUFF, 0x2E, BY46)
        CreateDWordField (BUFF, 0x37, BY55)
        BY28 = \_SB.PCI0.LPC0.EC0.SDT3
        BY37 = \_SB.PCI0.LPC0.EC0.SDT2
        BY46 = \_SB.PCI0.LPC0.EC0.SDT1
        BY55 = \_SB.PCI0.LPC0.EC0.SDT0
        CreateByteField (BUFF, 0x3D, BY61)
        CreateByteField (BUFF, 0x46, BY70)
        CreateByteField (BUFF, 0x4F, BY79)
        CreateByteField (BUFF, 0x58, BY88)
        BY61 = \_SB.PCI0.LPC0.EC0.WUC3
        BY70 = \_SB.PCI0.LPC0.EC0.WUC2
        BY79 = \_SB.PCI0.LPC0.EC0.WUC1
        BY88 = \_SB.PCI0.LPC0.EC0.WUC0
        CreateDWordField (BUFF, 0x40, BY64)
        CreateDWordField (BUFF, 0x49, BY73)
        CreateDWordField (BUFF, 0x52, BY82)
        CreateDWordField (BUFF, 0x5B, BY91)
        BY64 = \_SB.PCI0.LPC0.EC0.WUT3
        BY73 = \_SB.PCI0.LPC0.EC0.WUT2
        BY82 = \_SB.PCI0.LPC0.EC0.WUT1
        BY91 = \_SB.PCI0.LPC0.EC0.WUT0
        If (((BY25 == Zero) && (BY28 == Zero)))
        {
            BY24 = 0xFF
            BY25 = 0xFF
            BY26 = 0xFF
            BY28 = Ones
        }

        If (((BY34 == Zero) && (BY37 == Zero)))
        {
            BY33 = 0xFF
            BY34 = 0xFF
            BY35 = 0xFF
            BY37 = Ones
        }

        If (((BY43 == Zero) && (BY46 == Zero)))
        {
            BY42 = 0xFF
            BY43 = 0xFF
            BY44 = 0xFF
            BY46 = Ones
        }

        If (((BY52 == Zero) && (BY55 == Zero)))
        {
            BY51 = 0xFF
            BY52 = 0xFF
            BY53 = 0xFF
            BY55 = Ones
        }

        If (((BY61 == Zero) && (BY64 == Zero)))
        {
            BY60 = 0xFF
            BY61 = 0xFF
            BY64 = Ones
        }

        If (((BY70 == Zero) && (BY73 == Zero)))
        {
            BY69 = 0xFF
            BY70 = 0xFF
            BY73 = Ones
        }

        If (((BY79 == Zero) && (BY82 == Zero)))
        {
            BY78 = 0xFF
            BY79 = 0xFF
            BY82 = Ones
        }

        If (((BY88 == Zero) && (BY91 == Zero)))
        {
            BY87 = 0xFF
            BY88 = 0xFF
            BY91 = Ones
        }

        STAT = Zero
        Return (BUFF) /* \GLOG.BUFF */
    }

    Method (SLED, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SLED.BUFF */
    }

    Method (GLED, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GLED.BUFF */
    }

    Method (GNTB, 1, NotSerialized)
    {
        DAIN = Arg0
        HSMI ()
        Return (DAOU) /* External reference */
    }

    Method (SNTB, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, SNBS)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = ToInteger (Local0)
        BUFF = DAOU /* External reference */
        Switch (ToInteger (SNBS))
        {
            Case (Zero)
            {
            }
            Case (0x02)
            {
            }
            Case (0x08)
            {
            }
            Case (0x0A)
            {
            }
            Case (0x0C)
            {
            }
            Default
            {
                STAT = One
            }

        }

        HSMI ()
        Return (BUFF) /* \SNTB.BUFF */
    }

    Method (SSWL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SSWL.BUFF */
    }

    Method (GSWL, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (Arg0, 0x02, DIN2)
        CreateByteField (Arg0, 0x03, DIN3)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, ISSJ)
        STAT = Zero
        If ((ToInteger (DIN2) == One))
        {
            CreateByteField (BUFF, 0x02, SDCS)
            CreateByteField (BUFF, 0x03, SDVA)
            CreateByteField (BUFF, 0x04, SDRR)
            CreateDWordField (BUFF, 0x05, SDTM)
            Switch (ToInteger (DIN3))
            {
                Case (Zero)
                {
                    ISSJ = 0xEE
                    If ((\_SB.PCI0.LPC0.EC0.SDC3 == One))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x03))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x04))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x12))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC3 == 0x13))
                    {
                        ISSJ = 0xCC
                    }

                    SDCS = \_SB.PCI0.LPC0.EC0.SDC3
                    SDVA = \_SB.PCI0.LPC0.EC0.SDV3
                    SDTM = \_SB.PCI0.LPC0.EC0.SDT3
                }
                Case (One)
                {
                    ISSJ = 0xEE
                    If ((\_SB.PCI0.LPC0.EC0.SDC2 == One))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x03))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x04))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x12))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC2 == 0x13))
                    {
                        ISSJ = 0xCC
                    }

                    SDCS = \_SB.PCI0.LPC0.EC0.SDC2
                    SDVA = \_SB.PCI0.LPC0.EC0.SDV2
                    SDTM = \_SB.PCI0.LPC0.EC0.SDT2
                }
                Case (0x02)
                {
                    ISSJ = 0xEE
                    If ((\_SB.PCI0.LPC0.EC0.SDC1 == One))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x03))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x04))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x12))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC1 == 0x13))
                    {
                        ISSJ = 0xCC
                    }

                    SDCS = \_SB.PCI0.LPC0.EC0.SDC1
                    SDVA = \_SB.PCI0.LPC0.EC0.SDV1
                    SDTM = \_SB.PCI0.LPC0.EC0.SDT1
                }
                Case (0x03)
                {
                    ISSJ = 0xEE
                    If ((\_SB.PCI0.LPC0.EC0.SDC0 == One))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x03))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x04))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x12))
                    {
                        ISSJ = 0xCC
                    }

                    If ((\_SB.PCI0.LPC0.EC0.SDC0 == 0x13))
                    {
                        ISSJ = 0xCC
                    }

                    SDCS = \_SB.PCI0.LPC0.EC0.SDC0
                    SDVA = \_SB.PCI0.LPC0.EC0.SDV0
                    SDTM = \_SB.PCI0.LPC0.EC0.SDT0
                }
                Default
                {
                    STAT = One
                    ISSJ = 0xFF
                    SDCS = 0xFF
                    SDVA = 0xFF
                    SDRR = 0xFF
                    SDTM = Ones
                }

            }
        }
        ElseIf ((ToInteger (DIN2) == 0x02))
        {
            CreateByteField (BUFF, 0x02, WUCS)
            CreateWordField (BUFF, 0x03, WURR)
            CreateDWordField (BUFF, 0x05, WUTM)
            Switch (ToInteger (DIN3))
            {
                Case (Zero)
                {
                    ISSJ = 0xCC
                    WUCS = \_SB.PCI0.LPC0.EC0.WUC3
                    WUTM = \_SB.PCI0.LPC0.EC0.WUT3
                }
                Case (One)
                {
                    ISSJ = 0xCC
                    WUCS = \_SB.PCI0.LPC0.EC0.WUC2
                    WUTM = \_SB.PCI0.LPC0.EC0.WUT2
                }
                Case (0x02)
                {
                    ISSJ = 0xCC
                    WUCS = \_SB.PCI0.LPC0.EC0.WUC1
                    WUTM = \_SB.PCI0.LPC0.EC0.WUT1
                }
                Case (0x03)
                {
                    ISSJ = 0xCC
                    WUCS = \_SB.PCI0.LPC0.EC0.WUC0
                    WUTM = \_SB.PCI0.LPC0.EC0.WUT0
                }
                Default
                {
                    STAT = One
                    ISSJ = 0xFF
                    WUCS = 0xFF
                    WURR = 0xFFFF
                    WUTM = Ones
                }

            }
        }
        Else
        {
            CreateByteField (BUFF, 0x02, RRR1)
            CreateWordField (BUFF, 0x03, RRR2)
            CreateDWordField (BUFF, 0x05, RRR3)
            ISSJ = 0xFF
            RRR1 = 0xFF
            RRR2 = 0xFFFF
            RRR3 = Ones
            STAT = One
        }

        Return (BUFF) /* \GSWL.BUFF */
    }

    Method (SECL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SECL.BUFF */
    }

    Method (GECL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GECL.BUFF */
    }

    Method (SPDV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SPDV.BUFF */
    }

    Method (GPDV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GPDV.BUFF */
    }

    Method (SOSF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SOSF.BUFF */
    }

    Method (GOSF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GOSF.BUFF */
    }

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }

    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2, 
        Offset (0x3BB), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3E4), 
        BLNK,   2
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        PRWP [One] = Arg1
        If ((DAS3 == Zero))
        {
            If ((Arg1 <= 0x03))
            {
                PRWP [One] = Zero
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Method (SPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            BLNK = One
        }

        If (((Arg0 == 0x04) || (Arg0 == 0x05)))
        {
            BLNK = Zero
        }

        If ((Arg0 == 0x03))
        {
            RSTU = Zero
        }

        CLPS = One
        SLPS = One
        PEWS = PEWS /* \PEWS */
    }

    Method (SWAK, 1, NotSerialized)
    {
        BLNK = 0x03
        If ((Arg0 == 0x03))
        {
            RSTU = One
        }

        PEWS = PEWS /* \PEWS */
        PWDE = One
        PEWD = Zero
    }

    Method (TPST, 1, Serialized)
    {
        Local0 = (Arg0 + 0xB0000000)
        OperationRegion (VARM, SystemIO, 0x80, 0x04)
        Field (VARM, DWordAcc, NoLock, Preserve)
        {
            VARR,   32
        }

        VARR = Local0
    }

    OperationRegion (GNVS, SystemMemory, 0xAF362A98, 0x00000188)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        DPTC,   8, 
        ECTL,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64
    }

    OperationRegion (OGNS, SystemMemory, 0xAF362D18, 0x0000000C)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        OG00,   8, 
        OG01,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        DTEN,   8, 
        SDMO,   8, 
        OG08,   8, 
        OG09,   8, 
        RV2I,   8, 
        ISDS,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50) {})
        Name (STG2, Buffer (0x50) {})
        STG1 = Arg0
        STG2 = Arg1
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = Zero
        While ((Local0 < SizeOf (Arg0)))
        {
            If ((DerefOf (STG1 [Local0]) != DerefOf (STG2 [Local0]
                )))
            {
                Return (Zero)
            }

            Local0++
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Local1 = SizeOf (Arg1)
        If ((Local0 != Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0) {})
        BUF0 = Arg0
        Name (BUF1, Buffer (Local0) {})
        BUF1 = Arg1
        Local2 = Zero
        While ((Local2 < Local0))
        {
            Local3 = DerefOf (BUF0 [Local2])
            Local4 = DerefOf (BUF1 [Local2])
            If ((Local3 != Local4))
            {
                Return (Zero)
            }

            Local2++
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If ((OSTB == Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                OSTB = Zero
                TPOS = Zero
                If (_OSI ("Windows 2001"))
                {
                    OSTB = 0x08
                    TPOS = 0x08
                }

                If (_OSI ("Windows 2001.1"))
                {
                    OSTB = 0x20
                    TPOS = 0x20
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    OSTB = 0x10
                    TPOS = 0x10
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    OSTB = 0x11
                    TPOS = 0x11
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    OSTB = 0x12
                    TPOS = 0x12
                }

                If (_OSI ("Windows 2006"))
                {
                    OSTB = 0x40
                    TPOS = 0x40
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    OSTB = 0x41
                    TPOS = 0x41
                    OSSP = One
                }

                If (_OSI ("Windows 2009"))
                {
                    OSSP = One
                    OSTB = 0x50
                    TPOS = 0x50
                }

                If (_OSI ("Windows 2012"))
                {
                    OSSP = One
                    OSTB = 0x60
                    TPOS = 0x60
                }

                If (_OSI ("Windows 2013"))
                {
                    OSSP = One
                    OSTB = 0x61
                    TPOS = 0x61
                }

                If (_OSI ("Windows 2015"))
                {
                    OSSP = One
                    OSTB = 0x70
                    TPOS = 0x70
                }

                If (_OSI ("Linux"))
                {
                    LINX = One
                    OSTB = 0x80
                    TPOS = 0x80
                }
            }
            ElseIf (CondRefOf (\_OS, Local0))
            {
                If (SEQL (_OS, "Microsoft Windows"))
                {
                    OSTB = One
                    TPOS = One
                }
                ElseIf (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    OSTB = 0x02
                    TPOS = 0x02
                }
                ElseIf (SEQL (_OS, "Microsoft Windows NT"))
                {
                    OSTB = 0x04
                    TPOS = 0x04
                }
                Else
                {
                    OSTB = Zero
                    TPOS = Zero
                }
            }
            Else
            {
                OSTB = Zero
                TPOS = Zero
            }
        }

        Return (OSTB) /* \OSTB */
    }

    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000) {})
    OperationRegion (MDBG, SystemMemory, 0xAF355018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }

    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        MDG0 = MBUF /* \MBUF */
    }

    Method (DW2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x08)
        Local0 &= 0xFF
        Local1 &= 0xFF
        DB2H (Local1)
        BUFN--
        DB2H (Local0)
    }

    Method (DD2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x10)
        Local0 &= 0xFFFF
        Local1 &= 0xFFFF
        DW2H (Local1)
        BUFN--
        DW2H (Local0)
    }

    Method (MBGS, 1, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Name (BUFS, Buffer (Local0) {})
        BUFS = Arg0
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (BUFS [(SizeOf (Arg0) - Local0)]))
            Local0--
        }

        MDG0 = MBUF /* \MBUF */
    }

    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC ((Arg0 >> 0x04)))
        MDGC (NTOC (Arg0))
    }

    Method (LINE, 0, Serialized)
    {
        Local0 = BUFN /* \BUFN */
        Local0 &= 0x0F
        While (Local0)
        {
            MDGC (Zero)
            Local0++
            Local0 &= 0x0F
        }
    }

    Method (MDGC, 1, Serialized)
    {
        MBUF [BUFN] = Arg0
        BUFN += One
        If ((BUFN > 0x0FFF))
        {
            BUFN &= 0x0FFF
            UP_L (One)
        }
    }

    Method (UP_L, 1, Serialized)
    {
        Local2 = Arg0
        Local2 <<= 0x04
        MOVE (Local2)
        Local3 = (0x1000 - Local2)
        While (Local2)
        {
            MBUF [Local3] = Zero
            Local3++
            Local2--
        }
    }

    Method (MOVE, 1, Serialized)
    {
        Local4 = Arg0
        BUFN = Zero
        Local5 = (0x1000 - Local4)
        While (Local5)
        {
            Local5--
            MBUF [BUFN] = DerefOf (MBUF [Local4])
            BUFN++
            Local4++
        }
    }

    Method (NTOC, 1, Serialized)
    {
        Local0 = (Arg0 & 0x0F)
        If ((Local0 < 0x0A))
        {
            Local0 += 0x30
        }
        Else
        {
            Local0 += 0x37
        }

        Return (Local0)
    }

    Scope (_PR)
    {
        Processor (C000, 0x00, 0x00000410, 0x06) {}
        Processor (C001, 0x01, 0x00000410, 0x06) {}
        Processor (C002, 0x02, 0x00000410, 0x06) {}
        Processor (C003, 0x03, 0x00000410, 0x06) {}
        Processor (C004, 0x04, 0x00000410, 0x06) {}
        Processor (C005, 0x05, 0x00000410, 0x06) {}
        Processor (C006, 0x06, 0x00000410, 0x06) {}
        Processor (C007, 0x07, 0x00000410, 0x06) {}
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If ((DAS3 == One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GPP0, 0x02) // Device Wake
            Notify (\_SB.PCI0.GPP1, 0x02) // Device Wake
            Notify (\_SB.PCI0.GPP2, 0x02) // Device Wake
            Notify (\_SB.PCI0.GPP3, 0x02) // Device Wake
            Notify (\_SB.PCI0.GPP4, 0x02) // Device Wake
            Notify (\_SB.PCI0.GPP5, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP18, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L13, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GPP3, 0x02) // Device Wake
        }

        Method (_L15, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GPP1, 0x02) // Device Wake
        }

        Method (_L19, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            Notify (\_SB.PCI0.GP17.XHC0, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17.XHC1, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
        GPIC = Arg0
        If (PICM)
        {
            \_SB.DSPI ()
            If (NAPC)
            {
                \_SB.PCI0.NAPE ()
            }
        }
    }

    Method (WRCM, 2, Serialized)
    {
        OperationRegion (CMOS, SystemIO, 0x70, 0x04)
        Field (CMOS, AnyAcc, NoLock, Preserve)
        {
            LIND,   8, 
            LDAT,   8, 
            HIND,   8, 
            HDAT,   8
        }

        HIND = Arg0
        HDAT = Arg1
    }

    Method (RDCM, 1, Serialized)
    {
        OperationRegion (CMOS, SystemIO, 0x70, 0x04)
        Field (CMOS, AnyAcc, NoLock, Preserve)
        {
            LIND,   8, 
            LDAT,   8, 
            HIND,   8, 
            HDAT,   8
        }

        HIND = Arg0
        Local0 = HDAT /* \RDCM.HDAT */
        Return (Local0)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        \_SB.PCI0.LPC0.EC0.ECMD (0x9B)
        \_SB.SCUF = Zero
        WRCM (0x67, One)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x1051)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x1053)
            WRCM (0x04, \_SB.PCI0.LPC0.EC0.KCMS)
            SLPS = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x1054)
            WRCM (0x04, \_SB.PCI0.LPC0.EC0.KCMS)
            SLPS = One
            RSTU = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x1055)
            WRCM (0x04, \_SB.PCI0.LPC0.EC0.KCMS)
            If ((WKPM == One))
            {
                PWDE = One
            }

            BCMD = 0x90
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
        }

        If (CondRefOf (\_SB.TPM2.PTS))
        {
            \_SB.TPM2.PTS (Arg0)
        }

        \_SB.APTS (Arg0, MPTS (Arg0))
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        \_SB.PCI0.LPC0.EC0.BPWR = Zero
        \_SB.AWAK (Arg0)
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If ((GPIC != Zero))
            {
                \_SB.DSPI ()
                If (NAPC)
                {
                    \_SB.PCI0.NAPE ()
                }
            }

            \_SB.PCI0.LPC0.EC0.SELE ()
            \_SB.PCI0.LPC0.EC0.CHKB ()
            \_SB.PCI0.LPC0.EC0.CPSM = 0x02
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x10E3)
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x10E4)
            If ((\_SB.SCUF == 0x99))
            {
                NSMI ()
            }

            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        \_SB.SCUF = Zero
        \_SB.PCI0.LPC0.EC0.ERRL = Zero
        \_SB.ACAD.ACDC = 0xFF
        MWAK (Arg0)
        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((GPIC != Zero))
                {
                    DSPI ()
                    If (NAPC)
                    {
                        NAPE ()
                    }
                }

                OSTP ()
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x1D
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)) {}
                        If ((CTRL & 0x04)) {}
                        If ((CTRL & 0x10)) {}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (TOM, 0, NotSerialized)
            {
                Local0 = (TOML * 0x00010000)
                Local1 = (TOMH * 0x01000000)
                Local0 += Local1
                Return (Local0)
            }

            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFED3FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02D40000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)  // _LEN: Length
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, BTN1)  // _MIN: Minimum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, BTX1)  // _MAX: Maximum Base Address
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, BTL1)  // _LEN: Length
                BTMN = TOM ()
                BTMX = (PCBA - One)
                BTLN = (PCBA - BTMN) /* \_SB_.PCI0._CRS.BTMN */
                BTN1 = (PCBL + One)
                BTL1 = (BTX1 - BTN1) /* \_SB_.PCI0._CRS.BTN1 */
                BTL1 += One
                If ((MM64 == One))
                {
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MIN, M1MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MAX, M1MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y02._LEN, M1LN)  // _LEN: Length
                    M1MN = HMB1 /* \HMB1 */
                    M1MX = HMM1 /* \HMM1 */
                    M1LN = HML1 /* \HML1 */
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MIN, M2MN)  // _MIN: Minimum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MAX, M2MX)  // _MAX: Maximum Base Address
                    CreateQWordField (CRES, \_SB.PCI0._Y03._LEN, M2LN)  // _LEN: Length
                    M2MN = HMB2 /* \HMB2 */
                    M2MX = HMM2 /* \HMM2 */
                    M2LN = HML2 /* \HML2 */
                }

                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (BAR3, 0xFDE00000)
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y04)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y05)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y06)
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._BAS, MB01)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._LEN, ML01)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._BAS, MB02)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._LEN, ML02)  // _LEN: Length
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._BAS, MB03)  // _BAS: Base Address
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._LEN, ML03)  // _LEN: Length
                    If (GPIC)
                    {
                        MB01 = 0xFEC00000
                        MB02 = 0xFEE00000
                        ML01 = 0x1000
                        If (NAPC)
                        {
                            ML01 += 0x1000
                        }

                        ML02 = 0x1000
                    }

                    If ((BAR3 != 0xFFF00000))
                    {
                        MB03 = BAR3 /* \_SB_.PCI0.MEMR.BAR3 */
                        ML03 = 0x00100000
                    }

                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Mutex (NAPM, 0x00)
            Method (NAPE, 0, NotSerialized)
            {
                Acquire (NAPM, 0xFFFF)
                Local0 = (PCBA + 0xB8)
                OperationRegion (VARM, SystemMemory, Local0, 0x08)
                Field (VARM, DWordAcc, NoLock, Preserve)
                {
                    NAPX,   32, 
                    NAPD,   32
                }

                Local1 = NAPX /* \_SB_.PCI0.NAPE.NAPX */
                NAPX = 0x14300000
                Local0 = NAPD /* \_SB_.PCI0.NAPE.NAPD */
                Local0 &= 0xFFFFFFEF
                NAPD = Local0
                NAPX = Local1
                Release (NAPM)
            }

            Name (PR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKE, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }
            })
            Name (AR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Name (NR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x28
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x29
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x2A
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x2B
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x2B
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x24
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    If (NAPC)
                    {
                        Return (NR00) /* \_SB_.PCI0.NR00 */
                    }
                    Else
                    {
                        Return (AR00) /* \_SB_.PCI0.AR00 */
                    }
                }
                Else
                {
                    Return (PR00) /* \_SB_.PCI0.PR00 */
                }
            }

            Device (GPP0)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR01) /* \_SB_.PCI0.GPP0.NR01 */
                        }
                        Else
                        {
                            Return (AR01) /* \_SB_.PCI0.GPP0.AR01 */
                        }
                    }
                    Else
                    {
                        Return (PR01) /* \_SB_.PCI0.GPP0.PR01 */
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x05)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BCLB) /* \_SB_.PCI0.GPP0.VGA_.LCD_.BCLB */
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            BRTL = Arg0
                        }
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR02) /* \_SB_.PCI0.GPP1.NR02 */
                        }
                        Else
                        {
                            Return (AR02) /* \_SB_.PCI0.GPP1.AR02 */
                        }
                    }
                    Else
                    {
                        Return (PR02) /* \_SB_.PCI0.GPP1.PR02 */
                    }
                }

                Device (DEV0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }

                Device (DEV1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }
            }

            Device (GPP2)
            {
                Name (_ADR, 0x00010003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x21
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x23
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR03) /* \_SB_.PCI0.GPP2.NR03 */
                        }
                        Else
                        {
                            Return (AR03) /* \_SB_.PCI0.GPP2.AR03 */
                        }
                    }
                    Else
                    {
                        Return (PR03) /* \_SB_.PCI0.GPP2.PR03 */
                    }
                }

                Device (BCM5)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00010004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x25
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x27
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR04) /* \_SB_.PCI0.GPP3.NR04 */
                        }
                        Else
                        {
                            Return (AR04) /* \_SB_.PCI0.GPP3.AR04 */
                        }
                    }
                    Else
                    {
                        Return (PR04) /* \_SB_.PCI0.GPP3.PR04 */
                    }
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00010005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x29
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR05) /* \_SB_.PCI0.GPP4.NR05 */
                        }
                        Else
                        {
                            Return (AR05) /* \_SB_.PCI0.GPP4.AR05 */
                        }
                    }
                    Else
                    {
                        Return (PR05) /* \_SB_.PCI0.GPP4.PR05 */
                    }
                }
            }

            Device (GPP5)
            {
                Name (_ADR, 0x00010006)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR06) /* \_SB_.PCI0.GPP5.NR06 */
                        }
                        Else
                        {
                            Return (AR06) /* \_SB_.PCI0.GPP5.AR06 */
                        }
                    }
                    Else
                    {
                        Return (PR06) /* \_SB_.PCI0.GPP5.PR06 */
                    }
                }
            }

            Device (GPP6)
            {
                Name (_ADR, 0x00010007)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x30
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x31
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x32
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x33
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR07) /* \_SB_.PCI0.GPP6.NR07 */
                        }
                        Else
                        {
                            Return (AR07) /* \_SB_.PCI0.GPP6.AR07 */
                        }
                    }
                    Else
                    {
                        Return (PR07) /* \_SB_.PCI0.GPP6.PR07 */
                    }
                }
            }

            Device (GP17)
            {
                Name (_ADR, 0x00080001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x19, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x19, Zero))
                    }
                }

                Name (PR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x34
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x35
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x36
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x37
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR17) /* \_SB_.PCI0.GP17.NR17 */
                        }
                        Else
                        {
                            Return (AR17) /* \_SB_.PCI0.GP17.AR17 */
                        }
                    }
                    Else
                    {
                        Return (PR17) /* \_SB_.PCI0.GP17.PR17 */
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x07)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240, 
                            0x00031000, 
                            0x00032000
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BCLB) /* \_SB_.PCI0.GP17.VGA_.LCD_.BCLB */
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            BRTL = Arg0
                        }
                    }
                }

                Device (PSP)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ACP)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (AZAL)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
                    {
                        Return (Zero)
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        If ((OWUS == One))
                        {
                            Return (GPRW (0x19, 0x03))
                        }
                        Else
                        {
                            Return (GPRW (0x19, Zero))
                        }
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (XUPC, Package (0x04)
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (SUPC, 2, NotSerialized)
                        {
                            If ((Arg0 != Zero))
                            {
                                XUPC [Zero] = 0xFF
                                XUPC [One] = Arg1
                            }
                            Else
                            {
                                XUPC [Zero] = Zero
                                XUPC [One] = 0xFF
                            }

                            Return (XUPC) /* \_SB_.PCI0.GP17.XHC0.RHUB.XUPC */
                        }

                        Name (XPLD, Package (0x01)
                        {
                            Buffer (0x14)
                            {
                                /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0008 */  0x31, 0x9C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // 1.......
                                /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                            }
                        })
                        Method (SPLD, 2, NotSerialized)
                        {
                            CreateField (DerefOf (XPLD [Zero]), 0x40, One, UVSB)
                            CreateField (DerefOf (XPLD [Zero]), 0x57, 0x08, GPPS)
                            CreateField (DerefOf (XPLD [Zero]), 0x60, One, EJTB)
                            GPPS = Arg0
                            UVSB = Arg1
                            EJTB = Arg1
                            Return (XPLD) /* \_SB_.PCI0.GP17.XHC0.RHUB.XPLD */
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0x09))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (One, One))
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (One, Zero))
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0x03))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x02, One))
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0x03))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x02, One))
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0x03))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x03, One))
                            }
                        }

                        Device (PRT7)
                        {
                            Name (_ADR, 0x07)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x03, Zero))
                            }
                        }

                        Device (PR4A)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If ((I130 == Zero))
                                {
                                    If ((I142 == One))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }

                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x04, Zero))
                            }

                            Device (CCDA)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                {
                                    ToPLD (
                                        PLD_Revision           = 0x2,
                                        PLD_IgnoreColor        = 0x1,
                                        PLD_Red                = 0x0,
                                        PLD_Green              = 0x0,
                                        PLD_Blue               = 0x0,
                                        PLD_Width              = 0x0,
                                        PLD_Height             = 0x0,
                                        PLD_UserVisible        = 0x0,
                                        PLD_Dock               = 0x0,
                                        PLD_Lid                = 0x1,
                                        PLD_Panel              = "FRONT",
                                        PLD_VerticalPosition   = "UPPER",
                                        PLD_HorizontalPosition = "CENTER",
                                        PLD_Shape              = "UNKNOWN",
                                        PLD_GroupOrientation   = 0x0,
                                        PLD_GroupToken         = 0x0,
                                        PLD_GroupPosition      = 0x0,
                                        PLD_Bay                = 0x0,
                                        PLD_Ejectable          = 0x0,
                                        PLD_EjectRequired      = 0x0,
                                        PLD_CabinetNumber      = 0x0,
                                        PLD_CardCageNumber     = 0x0,
                                        PLD_Reference          = 0x0,
                                        PLD_Rotation           = 0x0,
                                        PLD_Order              = 0x0,
                                        PLD_VerticalOffset     = 0xFFFF,
                                        PLD_HorizontalOffset   = 0xFFFF)

                                })
                            }
                        }

                        Device (PR4B)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If ((I142 == Zero))
                                {
                                    If ((I130 == Zero))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x04, Zero))
                            }

                            Device (PRH1)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (SUPC (One, 0xFF))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (SPLD (0x07, Zero))
                                }

                                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("ea9a9c7b-7bab-468c-84fa-a9a59f8ad1cb") /* Unknown UUID */))
                                    {
                                        Switch (ToInteger (Arg2))
                                        {
                                            Case (One)
                                            {
                                                M010 (0x07, Zero)
                                                Sleep (0x1E)
                                                M010 (0x07, One)
                                                Sleep (0x32)
                                                M010 (0x07, Zero)
                                            }

                                        }
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }
                                }
                            }

                            Device (PRH2)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (SUPC (One, 0xFF))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (SPLD (0x08, Zero))
                                }

                                Device (CCDB)
                                {
                                    Name (_ADR, 0x02)  // _ADR: Address
                                    Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                    {
                                        ToPLD (
                                            PLD_Revision           = 0x2,
                                            PLD_IgnoreColor        = 0x1,
                                            PLD_Red                = 0x0,
                                            PLD_Green              = 0x0,
                                            PLD_Blue               = 0x0,
                                            PLD_Width              = 0x0,
                                            PLD_Height             = 0x0,
                                            PLD_UserVisible        = 0x0,
                                            PLD_Dock               = 0x0,
                                            PLD_Lid                = 0x1,
                                            PLD_Panel              = "FRONT",
                                            PLD_VerticalPosition   = "UPPER",
                                            PLD_HorizontalPosition = "CENTER",
                                            PLD_Shape              = "UNKNOWN",
                                            PLD_GroupOrientation   = 0x0,
                                            PLD_GroupToken         = 0x0,
                                            PLD_GroupPosition      = 0x0,
                                            PLD_Bay                = 0x0,
                                            PLD_Ejectable          = 0x0,
                                            PLD_EjectRequired      = 0x0,
                                            PLD_CabinetNumber      = 0x0,
                                            PLD_CardCageNumber     = 0x0,
                                            PLD_Reference          = 0x0,
                                            PLD_Rotation           = 0x0,
                                            PLD_Order              = 0x0,
                                            PLD_VerticalOffset     = 0xFFFF,
                                            PLD_HorizontalOffset   = 0xFFFF)

                                    })
                                }
                            }
                        }

                        Device (PR8A)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If ((I130 == Zero))
                                {
                                    If ((I142 == One))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                                Else
                                {
                                    Return (0x0F)
                                }
                            }

                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x04, Zero))
                            }

                            Device (CCDA)
                            {
                                Name (_ADR, 0x08)  // _ADR: Address
                                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                {
                                    ToPLD (
                                        PLD_Revision           = 0x2,
                                        PLD_IgnoreColor        = 0x1,
                                        PLD_Red                = 0x0,
                                        PLD_Green              = 0x0,
                                        PLD_Blue               = 0x0,
                                        PLD_Width              = 0x0,
                                        PLD_Height             = 0x0,
                                        PLD_UserVisible        = 0x0,
                                        PLD_Dock               = 0x0,
                                        PLD_Lid                = 0x1,
                                        PLD_Panel              = "FRONT",
                                        PLD_VerticalPosition   = "UPPER",
                                        PLD_HorizontalPosition = "CENTER",
                                        PLD_Shape              = "UNKNOWN",
                                        PLD_GroupOrientation   = 0x0,
                                        PLD_GroupToken         = 0x0,
                                        PLD_GroupPosition      = 0x0,
                                        PLD_Bay                = 0x0,
                                        PLD_Ejectable          = 0x0,
                                        PLD_EjectRequired      = 0x0,
                                        PLD_CabinetNumber      = 0x0,
                                        PLD_CardCageNumber     = 0x0,
                                        PLD_Reference          = 0x0,
                                        PLD_Rotation           = 0x0,
                                        PLD_Order              = 0x0,
                                        PLD_VerticalOffset     = 0xFFFF,
                                        PLD_HorizontalOffset   = 0xFFFF)

                                })
                            }
                        }

                        Device (PR8B)
                        {
                            Name (_ADR, 0x08)  // _ADR: Address
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                If ((I142 == Zero))
                                {
                                    If ((I130 == Zero))
                                    {
                                        Return (0x0F)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }

                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x04, Zero))
                            }

                            Device (PRH1)
                            {
                                Name (_ADR, One)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (SUPC (Zero, 0xFF))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (SPLD (0x07, Zero))
                                }

                                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                                {
                                    If ((Arg0 == ToUUID ("ea9a9c7b-7bab-468c-84fa-a9a59f8ad1cb") /* Unknown UUID */))
                                    {
                                        Switch (ToInteger (Arg2))
                                        {
                                            Case (One)
                                            {
                                                M010 (0x07, Zero)
                                                Sleep (0x1E)
                                                M010 (0x07, One)
                                                Sleep (0x32)
                                                M010 (0x07, Zero)
                                            }

                                        }
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }
                                }
                            }

                            Device (PRH2)
                            {
                                Name (_ADR, 0x02)  // _ADR: Address
                                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (SUPC (Zero, 0xFF))
                                }

                                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                                {
                                    Return (SPLD (0x08, Zero))
                                }

                                Device (CCDB)
                                {
                                    Name (_ADR, 0x02)  // _ADR: Address
                                    Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                                    {
                                        ToPLD (
                                            PLD_Revision           = 0x2,
                                            PLD_IgnoreColor        = 0x1,
                                            PLD_Red                = 0x0,
                                            PLD_Green              = 0x0,
                                            PLD_Blue               = 0x0,
                                            PLD_Width              = 0x0,
                                            PLD_Height             = 0x0,
                                            PLD_UserVisible        = 0x0,
                                            PLD_Dock               = 0x0,
                                            PLD_Lid                = 0x1,
                                            PLD_Panel              = "FRONT",
                                            PLD_VerticalPosition   = "UPPER",
                                            PLD_HorizontalPosition = "CENTER",
                                            PLD_Shape              = "UNKNOWN",
                                            PLD_GroupOrientation   = 0x0,
                                            PLD_GroupToken         = 0x0,
                                            PLD_GroupPosition      = 0x0,
                                            PLD_Bay                = 0x0,
                                            PLD_Ejectable          = 0x0,
                                            PLD_EjectRequired      = 0x0,
                                            PLD_CabinetNumber      = 0x0,
                                            PLD_CardCageNumber     = 0x0,
                                            PLD_Reference          = 0x0,
                                            PLD_Rotation           = 0x0,
                                            PLD_Order              = 0x0,
                                            PLD_VerticalOffset     = 0xFFFF,
                                            PLD_HorizontalOffset   = 0xFFFF)

                                    })
                                }
                            }
                        }
                    }
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
                    {
                        Return (Zero)
                    }

                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        If ((OWUS == One))
                        {
                            Return (GPRW (0x19, 0x03))
                        }
                        Else
                        {
                            Return (GPRW (0x19, Zero))
                        }
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Name (XUPC, Package (0x04)
                        {
                            0xFF, 
                            0xFF, 
                            Zero, 
                            Zero
                        })
                        Method (SUPC, 2, NotSerialized)
                        {
                            If ((Arg0 != Zero))
                            {
                                XUPC [Zero] = 0xFF
                                XUPC [One] = Arg1
                            }
                            Else
                            {
                                XUPC [Zero] = Zero
                                XUPC [One] = 0xFF
                            }

                            Return (XUPC) /* \_SB_.PCI0.GP17.XHC1.RHUB.XUPC */
                        }

                        Name (XPLD, Package (0x01)
                        {
                            Buffer (0x14)
                            {
                                /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                /* 0008 */  0x31, 0x9C, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,  // 1.......
                                /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                            }
                        })
                        Method (SPLD, 2, NotSerialized)
                        {
                            CreateField (DerefOf (XPLD [Zero]), 0x40, One, UVSB)
                            CreateField (DerefOf (XPLD [Zero]), 0x57, 0x08, GPPS)
                            CreateField (DerefOf (XPLD [Zero]), 0x60, One, EJTB)
                            GPPS = Arg0
                            UVSB = Arg1
                            EJTB = Arg1
                            Return (XPLD) /* \_SB_.PCI0.GP17.XHC1.RHUB.XPLD */
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0x03))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                If ((I142 == Zero))
                                {
                                    If ((I130 == Zero))
                                    {
                                        Return (SPLD (0x05, One))
                                    }
                                    Else
                                    {
                                        Return (SPLD (0x05, Zero))
                                    }
                                }
                                Else
                                {
                                    Return (SPLD (0x05, Zero))
                                }
                            }

                            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg0 == ToUUID ("ea9a9c7b-7bab-468c-84fa-a9a59f8ad1cb") /* Unknown UUID */))
                                {
                                    Switch (ToInteger (Arg2))
                                    {
                                        Case (One)
                                        {
                                            M010 (0x07, Zero)
                                            Sleep (0x1E)
                                            M010 (0x07, One)
                                            Sleep (0x32)
                                            M010 (0x07, Zero)
                                        }

                                    }
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                If ((I142 == Zero))
                                {
                                    If ((I130 == Zero))
                                    {
                                        Return (SPLD (0x05, One))
                                    }
                                    Else
                                    {
                                        Return (SPLD (0x05, Zero))
                                    }
                                }
                                Else
                                {
                                    Return (SPLD (0x05, Zero))
                                }
                            }

                            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                            {
                                If ((Arg0 == ToUUID ("ea9a9c7b-7bab-468c-84fa-a9a59f8ad1cb") /* Unknown UUID */))
                                {
                                    Switch (ToInteger (Arg2))
                                    {
                                        Case (One)
                                        {
                                            M010 (0x07, Zero)
                                            Sleep (0x1E)
                                            M010 (0x07, One)
                                            Sleep (0x32)
                                            M010 (0x07, Zero)
                                        }

                                    }
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                            {
                                Return (SUPC (One, 0xFF))
                            }

                            Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                            {
                                Return (SPLD (0x06, Zero))
                            }
                        }
                    }
                }

                Device (MP2C)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }
            }

            Device (GP18)
            {
                Name (_ADR, 0x00080002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x36
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x37
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x34
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x35
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR18) /* \_SB_.PCI0.GP18.NR18 */
                        }
                        Else
                        {
                            Return (AR18) /* \_SB_.PCI0.GP18.AR18 */
                        }
                    }
                    Else
                    {
                        Return (PR18) /* \_SB_.PCI0.GP18.PR18 */
                    }
                }

                Device (SATA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HPEN == One))
                    {
                        If ((OSTB >= 0x40))
                        {
                            Return (0x0F)
                        }

                        HPEN = Zero
                        Return (One)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y07)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y07._BAS, HPEB)  // _BAS: Base Address
                    Local0 = 0xFED00000
                    HPEB = (Local0 & 0xFFFFFC00)
                    Return (BUF0) /* \_SB_.PCI0.HPET._CRS.BUF0 */
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.RTC_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.RTC_.BUF1 */
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.TMR_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.TMR_.BUF1 */
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, "MSFT0001")  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            _Y08)
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._LEN, PSIZ)  // _LEN: Length
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._BAS, PBAS)  // _BAS: Base Address
                        PSIZ = ROMS /* \ROMS */
                        Local0 = (ROMS - One)
                        PBAS = (Ones - Local0)
                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }
                }

                Method (ECOK, 0, NotSerialized)
                {
                    If ((^EC0.OKEC == One))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x00,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Name (_GPE, 0x03)  // _GPE: General Purpose Events
                    Name (OKEC, Zero)
                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If ((Arg0 == 0x03))
                        {
                            S80H (0x10A8)
                            OKEC = Arg1
                            If ((OKEC == One))
                            {
                                Notify (LID0, 0x80) // Status Change
                            }

                            BPWC = Zero
                            BPWR = Zero
                            CPSM = 0x02
                            SELE ()
                        }
                    }

                    Mutex (ECMT, 0x00)
                    Mutex (Z009, 0x00)
                    OperationRegion (ERAM, SystemMemory, 0xFF708300, 0x0100)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                        VERM,   8, 
                        VERS,   8, 
                        VERT,   8, 
                        Offset (0x04), 
                        YEAR,   8, 
                        MONT,   8, 
                        DAYS,   8, 
                        Offset (0x0C), 
                        BPWC,   8, 
                        BPWR,   8, 
                        Offset (0x10), 
                        LSTE,   1, 
                        Offset (0x12), 
                            ,   7, 
                        LPBF,   1, 
                        Offset (0x15), 
                        FNIS,   1, 
                        FNKL,   1, 
                            ,   2, 
                        WKYS,   1, 
                        Offset (0x16), 
                            ,   4, 
                        MICL,   1, 
                        Offset (0x17), 
                        ERRL,   8, 
                        Offset (0x1A), 
                            ,   2, 
                        NMIT,   1, 
                        Offset (0x1C), 
                            ,   1, 
                        SPMD,   1, 
                            ,   1, 
                            ,   1, 
                        WDTE,   1, 
                        WDBE,   1, 
                            ,   1, 
                        WDSE,   1, 
                        Offset (0x20), 
                        CTMP,   8, 
                        Offset (0x22), 
                        Offset (0x23), 
                        TSLO,   8, 
                        DNTC,   8, 
                        CNTC,   8, 
                        STM0,   8, 
                        TNTC,   8, 
                        STM1,   8, 
                        STM2,   8, 
                        Offset (0x2B), 
                        BTMP,   8, 
                        Offset (0x30), 
                        BDNA,   120, 
                        BDBC,   8, 
                        Offset (0x44), 
                        SLPO,   8, 
                        FAPO,   8, 
                        SUPO,   8, 
                        TCTL,   8, 
                        Offset (0x4C), 
                        UTYC,   8, 
                        DTYC,   8, 
                        UCHA,   8, 
                        DCHA,   8, 
                        Offset (0x54), 
                        SPDT,   8, 
                        GPPT,   8, 
                        DFDI,   8, 
                        DFDC,   8, 
                        Offset (0x59), 
                        CPSS,   8, 
                        CPSC,   8, 
                        CPSM,   8, 
                        BCCL,   8, 
                        BCCH,   8, 
                        Offset (0x60), 
                        BNAM,   152, 
                        BNBC,   8, 
                        Offset (0x7A), 
                        BTCC,   16, 
                        Offset (0x7E), 
                        BATL,   8, 
                        BATH,   8, 
                        ACDC,   1, 
                        BST1,   1, 
                        BST2,   1, 
                        Offset (0x81), 
                        BTML,   8, 
                        BTSN,   16, 
                        BTAP,   16, 
                        BTDV,   16, 
                        BLFC,   16, 
                        BTTP,   16, 
                        BSTI,   1, 
                        BSTV,   1, 
                        BSTC,   1, 
                        BSTF,   1, 
                        BSTD,   1, 
                        BSDD,   1, 
                        BSAN,   1, 
                        CHEM,   1, 
                        SBDC,   1, 
                        SBWC,   1, 
                        SBPC,   1, 
                        SBNC,   1, 
                        BIDC,   1, 
                        BIWC,   1, 
                        BIPC,   1, 
                        BINC,   1, 
                        BT1I,   16, 
                        BT1V,   16, 
                        BT1C,   16, 
                        BTFC,   16, 
                        B1CC,   16, 
                        B1CV,   16, 
                        BT1T,   16, 
                            ,   4, 
                        ISFD,   1, 
                        ISFC,   1, 
                        ISDC,   1, 
                        ISGI,   1, 
                        IART,   1, 
                        IARC,   1, 
                            ,   1, 
                        IATD,   1, 
                        IAOT,   1, 
                            ,   1, 
                        IATC,   1, 
                        IAOC,   1, 
                        RSOC,   16, 
                        Offset (0xC0), 
                        ALD0,   8, 
                        ALD1,   8, 
                        ALD2,   8, 
                        ALD3,   8, 
                        ALD4,   8, 
                        ALD5,   8, 
                        ALD6,   8, 
                        ALD7,   8, 
                        ALD8,   8, 
                        ALD9,   8, 
                        Offset (0xCC), 
                        FRHI,   8, 
                        FRLO,   8, 
                        F2HI,   8, 
                        F2LO,   8, 
                        UCPU,   8, 
                        DCPU,   8, 
                        UDDR,   8, 
                        DDDR,   8, 
                        UGPE,   8, 
                        DGPE,   8, 
                        Offset (0xDC), 
                        CPUF,   1, 
                        BAUF,   1, 
                        SYUF,   1, 
                        DRUF,   1, 
                        PHUF,   1, 
                        GPUF,   1, 
                        TCUF,   1, 
                        CHUF,   1, 
                        CPDF,   1, 
                        BADF,   1, 
                        SYDF,   1, 
                        DRDF,   1, 
                        PHDF,   1, 
                        GPDF,   1, 
                        TCDF,   1, 
                        CHDF,   1, 
                        TFUC,   1, 
                        TFUB,   1, 
                        TFUL,   1, 
                        TFUD,   1, 
                        TFUR,   1, 
                        TFUG,   1, 
                        TFUT,   1, 
                        TFUH,   1, 
                        TFDC,   1, 
                        TFDB,   1, 
                        TFDL,   1, 
                        TFDD,   1, 
                        TFDR,   1, 
                        TFDG,   1, 
                        TFDT,   1, 
                        TFDH,   1, 
                        SSWS,   8, 
                        Offset (0xE8), 
                        PADH,   8, 
                        PADL,   8, 
                        PBTH,   8, 
                        PBTL,   8, 
                        EWTH,   8, 
                        EWTL,   8, 
                        Offset (0xF0), 
                        SDSR,   8, 
                        WUSR,   8, 
                        Offset (0xFC), 
                        KCMS,   8
                    }

                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x7E), 
                        BATD,   16
                    }

                    OperationRegion (CRAM, SystemMemory, 0xFF708C00, 0x0100)
                    Field (CRAM, ByteAcc, Lock, Preserve)
                    {
                        Offset (0x70), 
                        SDC0,   8, 
                        Offset (0x72), 
                        SDV0,   8, 
                        Offset (0x74), 
                        SDT0,   32, 
                        SDC1,   8, 
                        Offset (0x7A), 
                        SDV1,   8, 
                        Offset (0x7C), 
                        SDT1,   32, 
                        SDC2,   8, 
                        Offset (0x82), 
                        SDV2,   8, 
                        Offset (0x84), 
                        SDT2,   32, 
                        SDC3,   8, 
                        Offset (0x8A), 
                        SDV3,   8, 
                        Offset (0x8C), 
                        SDT3,   32, 
                        WUC0,   8, 
                        Offset (0x94), 
                        WUT0,   32, 
                        WUC1,   8, 
                        Offset (0x9C), 
                        WUT1,   32, 
                        WUC2,   8, 
                        Offset (0xA4), 
                        WUT2,   32, 
                        WUC3,   8, 
                        Offset (0xAC), 
                        WUT3,   32
                    }

                    OperationRegion (ECIO, SystemIO, 0x60, 0x10)
                    Field (ECIO, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x02), 
                        DATP,   8, 
                        Offset (0x06), 
                        CMDS,   8, 
                        Offset (0x08), 
                        ECXD,   8, 
                        Offset (0x0C), 
                        ECXC,   8
                    }

                    Method (IBE2, 0, Serialized)
                    {
                        While ((CMDS & 0x02))
                        {
                            Sleep (0x50)
                        }
                    }

                    Method (ECMD, 1, Serialized)
                    {
                        IBE2 ()
                        CMDS = Arg0
                        IBE2 ()
                    }

                    Method (ECDW, 1, Serialized)
                    {
                        IBE2 ()
                        DATP = Arg0
                        IBE2 ()
                    }

                    Method (IBE3, 0, Serialized)
                    {
                        While ((ECXC & 0x02))
                        {
                            Sleep (0x50)
                        }
                    }

                    Method (ECM3, 1, Serialized)
                    {
                        IBE3 ()
                        ECXC = Arg0
                        IBE3 ()
                    }

                    Method (ECD3, 1, Serialized)
                    {
                        IBE3 ()
                        ECXD = Arg0
                        IBE3 ()
                    }

                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (^^^GP17.VGA.LCD, 0x87) // Device-Specific
                        ^^^^WMI1.WMEN = 0x0281
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (^^^GP17.VGA.LCD, 0x86) // Device-Specific
                        ^^^^WMI1.WMEN = 0x0282
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q03, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q2E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_QC6, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_QC4, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q21, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        ^^^^WMI1.WMEN = 0x0287
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q7E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        ^^^^WMI1.WMEN = 0x0289
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        ^^^^WMI1.WMEN = 0x028A
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q0C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q0D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                    }

                    Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (LID0, 0x80) // Status Change
                    }

                    Method (_Q1A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Notify (LID0, 0x80) // Status Change
                    }

                    Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (ECOK ())
                        {
                            Notify (ACAD, 0x80) // Status Change
                        }
                    }

                    Method (_Q33, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (ECOK ())
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q34, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (ECOK ())
                        {
                            Notify (BAT1, 0x81) // Information Change
                        }
                    }

                    Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (ECOK ())
                        {
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q3F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        If (ECOK ())
                        {
                            SELE ()
                            Notify (ACAD, 0x80) // Status Change
                            Notify (BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q60, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Name (UTDP, Buffer (0x08) {})
                        CreateWordField (UTDP, Zero, M254)
                        CreateByteField (UTDP, 0x02, M255)
                        CreateDWordField (UTDP, 0x03, M256)
                        M254 = 0x07
                        M255 = 0x06
                        M256 = (FAPO * 0x03E8)
                        ALIB (0x0C, UTDP)
                        M255 = 0x07
                        M256 = (SLPO * 0x03E8)
                        ALIB (0x0C, UTDP)
                        M255 = 0x05
                        M256 = (SUPO * 0x03E8)
                        ALIB (0x0C, UTDP)
                    }

                    Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Name (USP1, Buffer (0x08) {})
                        CreateWordField (USP1, Zero, M254)
                        CreateByteField (USP1, 0x02, M255)
                        CreateDWordField (USP1, 0x03, M256)
                        M254 = 0x07
                        M255 = 0x03
                        M256 = TCTL /* \_SB_.PCI0.LPC0.EC0_.TCTL */
                        ALIB (0x0C, USP1)
                    }

                    Method (_Q79, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        ^^^^UBTC.M318 ()
                        Notify (UBTC, 0x80) // Status Change
                    }

                    Method (_Q5E, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Switch (ToInteger (CPSC))
                        {
                            Case (One)
                            {
                                CPSC = Zero
                            }
                            Case (0x02)
                            {
                                CPSC = One
                            }

                        }

                        \_PR.C000.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C000, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C001.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C001, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C002.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C002, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C003.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C003, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C004.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C004, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C005.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C005, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C006.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C006, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C007.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C007, 0x80) // Performance Capability Change
                        Sleep (0x64)
                    }

                    Method (_Q5F, 0, Serialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Switch (ToInteger (CPSC))
                        {
                            Case (Zero)
                            {
                                CPSC = One
                            }
                            Case (One)
                            {
                                CPSC = 0x02
                            }

                        }

                        \_PR.C000.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C000, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C001.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C001, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C002.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C002, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C003.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C003, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C004.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C004, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C005.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C005, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C006.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C006, 0x80) // Performance Capability Change
                        Sleep (0x64)
                        \_PR.C007.PPCV = CPSC /* \_SB_.PCI0.LPC0.EC0_.CPSC */
                        Notify (\_PR.C007, 0x80) // Performance Capability Change
                        Sleep (0x64)
                    }

                    Method (_Q54, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        TCUF = One
                        ^^^^WMI1.WMEN = 0x0107
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q55, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        TCDF = One
                        ^^^^WMI1.WMEN = 0x0107
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q4E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CHUF = One
                        ^^^^WMI1.WMEN = 0x0108
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q4F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CHDF = One
                        ^^^^WMI1.WMEN = 0x0108
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q40, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CPUF = One
                        ^^^^WMI1.WMEN = 0x0100
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        CPDF = One
                        ^^^^WMI1.WMEN = 0x0100
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q50, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        DRUF = One
                        ^^^^WMI1.WMEN = 0x010B
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q51, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        DRDF = One
                        ^^^^WMI1.WMEN = 0x010B
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q46, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        GPUF = One
                        ^^^^WMI1.WMEN = 0x0105
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q47, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        GPDF = One
                        ^^^^WMI1.WMEN = 0x0105
                        Notify (WMI1, 0xA0) // Device-Specific
                    }

                    Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Name (USPL, Buffer (0x08) {})
                        CreateWordField (USPL, Zero, M254)
                        CreateByteField (USPL, 0x02, M255)
                        CreateDWordField (USPL, 0x03, M256)
                        M254 = 0x07
                        M255 = 0x05
                        M256 = (SSWS * 0x03E8)
                        ALIB (0x0C, USPL)
                    }

                    Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        Name (DSPL, Buffer (0x08) {})
                        CreateWordField (DSPL, Zero, M254)
                        CreateByteField (DSPL, 0x02, M255)
                        CreateDWordField (DSPL, 0x03, M256)
                        M254 = 0x07
                        M255 = 0x05
                        M256 = (SSWS * 0x03E8)
                        ALIB (0x0C, DSPL)
                    }

                    Name (BATO, 0xC0)
                    Name (BATN, Zero)
                    Method (SELE, 0, Serialized)
                    {
                        BATN = BATD /* \_SB_.PCI0.LPC0.EC0_.BATD */
                        If ((BATN & One))
                        {
                            ^^^^BAT1.BATP = 0x1F
                        }
                        Else
                        {
                            If ((((BATO & 0xC1) == One) && ((BATN & 0xC1
                                ) == 0xC0)))
                            {
                                ^^^^ACAD.ACRT = One
                                Notify (ACAD, 0x80) // Status Change
                                Sleep (0x0A)
                                Local1 = 0x0A
                                While (Local1)
                                {
                                    If (^^^^ACAD.ACRT)
                                    {
                                        Sleep (0x14)
                                        Notify (ACAD, 0x80) // Status Change
                                        Local1--
                                    }
                                    Else
                                    {
                                        Local1 = Zero
                                    }
                                }
                            }

                            ^^^^BAT1.BATP = 0x0F
                        }

                        If (((BATN & 0x0FFF) != (BATO & 0x0FFF)))
                        {
                            Notify (BAT1, 0x81) // Information Change
                            Notify (BAT1, One) // Device Check
                            If ((((BATO & One) == One) && ((BATN & One
                                ) == Zero)))
                            {
                                Sleep (0x14)
                            }
                        }

                        BATO = BATN /* \_SB_.PCI0.LPC0.EC0_.BATN */
                    }

                    Method (CHKB, 0, NotSerialized)
                    {
                        If ((^^^^BAT1.BATP == 0x1F))
                        {
                            If ((DerefOf (^^^^BAT1.PBIF [One]) != BTAP))
                            {
                                Notify (BAT1, 0x81) // Information Change
                                Notify (BAT1, One) // Device Check
                            }
                        }
                    }

                    Method (CTDP, 0, NotSerialized)
                    {
                    }
                }

                Mutex (PSMX, 0x00)
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x30), 
            USB1,   8, 
            Offset (0x34), 
            USB3,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8, 
            URT0,   8, 
            URT1,   8
        }

        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Local1 = PD64 /* \_SB_.PD64 */
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
            If (PICM)
            {
                HDAD = Arg0
                SDCL = Arg0
            }
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
            If (PICM)
            {
                USB1 = Arg0
                USB3 = Arg0
            }
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            If (PICM)
            {
                SATA = Arg0
            }
        }

        Name (PRS1, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,5,6,10,11}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRA && (PIRA != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRB && (PIRB != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRC && (PIRC != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRD && (PIRD != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRE && (PIRE != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRF && (PIRF != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRG && (PIRG != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRH && (PIRH != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xE4
            Sleep (0x02)
        }

        Method (S80H, 1, NotSerialized)
        {
            P80H = Arg0
            DCTC (Arg0)
        }

        Method (BSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xBE
            Sleep (One)
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Name (XX00, Buffer (0x03) {})
            Name (ACDC, 0xFF)
            Name (ACRT, Zero)
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = One
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (!Acquire (^^PCI0.LPC0.EC0.Z009, 0x012C))
                    {
                        Local0 = ^^PCI0.LPC0.EC0.ACDC /* \_SB_.PCI0.LPC0.EC0_.ACDC */
                        CreateWordField (XX00, Zero, SSZE)
                        CreateByteField (XX00, 0x02, ACST)
                        SSZE = 0x03
                        If ((Local0 != ACDC))
                        {
                            If (Local0)
                            {
                                AFN4 (One)
                                ACST = Zero
                            }
                            Else
                            {
                                AFN4 (0x02)
                                ACST = One
                            }

                            ALIB (One, XX00)
                            ACDC = Local0
                            ACRT = Zero
                        }

                        Release (^^PCI0.LPC0.EC0.Z009)
                    }
                }

                Return (Local0)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_PCL, 0, NotSerialized)  // _PCL: Power Consumer List
            {
                Return (_SB) /* \_SB_ */
            }

            Name (BATP, 0x0F)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (BATP) /* \_SB_.BAT1.BATP */
            }

            Name (PBIX, Package (0x14)
            {
                Zero, 
                One, 
                Ones, 
                Ones, 
                One, 
                Ones, 
                0x64, 
                0x32, 
                Zero, 
                0x00017318, 
                Ones, 
                Ones, 
                0x88B8, 
                0x61A8, 
                One, 
                One, 
                "BAT1", 
                " ", 
                " ", 
                " "
            })
            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (UPBX ())
                    {
                        PBIX [0x02] = Ones
                        PBIX [0x03] = Ones
                        PBIX [0x05] = Ones
                        PBIX [0x08] = Zero
                        PBIX [0x10] = "Bad"
                        PBIX [0x11] = "Bad"
                        PBIX [0x12] = "Bad"
                        PBIX [0x13] = "Bad"
                    }
                }

                Return (PBIX) /* \_SB_.BAT1.PBIX */
            }

            Method (UPBX, 0, NotSerialized)
            {
                If (((^^PCI0.LPC0.EC0.BATL & One) == Zero))
                {
                    Return (0xFF)
                }

                PBIX [0x02] = ^^PCI0.LPC0.EC0.BTAP /* \_SB_.PCI0.LPC0.EC0_.BTAP */
                Name (FDDC, Zero)
                FDDC = ((^^PCI0.LPC0.EC0.BTAP / 0x0A) * 0x0B)
                If ((^^PCI0.LPC0.EC0.BTFC >= FDDC))
                {
                    PBIX [0x03] = FDDC /* \_SB_.BAT1.UPBX.FDDC */
                }
                Else
                {
                    PBIX [0x03] = ^^PCI0.LPC0.EC0.BTFC /* \_SB_.PCI0.LPC0.EC0_.BTFC */
                }

                PBIX [0x05] = ^^PCI0.LPC0.EC0.BTDV /* \_SB_.PCI0.LPC0.EC0_.BTDV */
                PBIX [0x08] = ^^PCI0.LPC0.EC0.BTCC /* \_SB_.PCI0.LPC0.EC0_.BTCC */
                Local0 = ^^PCI0.LPC0.EC0.BDNA /* \_SB_.PCI0.LPC0.EC0_.BDNA */
                PBFE (Local0, ^^PCI0.LPC0.EC0.BDBC, Zero)
                PBIX [0x10] = Local0
                PBIX [0x11] = ITOS (ToBCD (^^PCI0.LPC0.EC0.BTSN))
                If (^^PCI0.LPC0.EC0.CHEM)
                {
                    PBIX [0x12] = "NiMH"
                }
                Else
                {
                    PBIX [0x12] = "LION"
                }

                Local0 = ^^PCI0.LPC0.EC0.BNAM /* \_SB_.PCI0.LPC0.EC0_.BNAM */
                PBFE (Local0, ^^PCI0.LPC0.EC0.BNBC, Zero)
                PBIX [0x13] = Local0
                Return (Zero)
            }

            Name (PBIF, Package (0x0D)
            {
                One, 
                Ones, 
                Ones, 
                One, 
                Ones, 
                0x64, 
                0x32, 
                One, 
                One, 
                "BAT1", 
                " ", 
                " ", 
                " "
            })
            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (UPBI ())
                    {
                        PBIF [One] = Ones
                        PBIF [0x02] = Ones
                        PBIF [0x04] = Ones
                        PBIF [0x09] = "Bad"
                        PBIF [0x0A] = "Bad"
                        PBIF [0x0B] = "Bad"
                        PBIF [0x0C] = "Bad"
                    }
                }

                Return (PBIF) /* \_SB_.BAT1.PBIF */
            }

            Method (UPBI, 0, NotSerialized)
            {
                If (((^^PCI0.LPC0.EC0.BATL & One) == Zero))
                {
                    Return (0xFF)
                }

                PBIF [One] = ^^PCI0.LPC0.EC0.BTAP /* \_SB_.PCI0.LPC0.EC0_.BTAP */
                PBIF [0x02] = ^^PCI0.LPC0.EC0.BTFC /* \_SB_.PCI0.LPC0.EC0_.BTFC */
                PBIF [0x04] = ^^PCI0.LPC0.EC0.BTDV /* \_SB_.PCI0.LPC0.EC0_.BTDV */
                Local0 = ^^PCI0.LPC0.EC0.BDNA /* \_SB_.PCI0.LPC0.EC0_.BDNA */
                PBFE (Local0, ^^PCI0.LPC0.EC0.BDBC, Zero)
                PBIF [0x09] = Local0
                PBIF [0x0A] = ITOS (ToBCD (^^PCI0.LPC0.EC0.BTSN))
                If (^^PCI0.LPC0.EC0.CHEM)
                {
                    PBIF [0x0B] = "NiMH"
                }
                Else
                {
                    PBIF [0x0B] = "LION"
                }

                Local0 = ^^PCI0.LPC0.EC0.BNAM /* \_SB_.PCI0.LPC0.EC0_.BNAM */
                PBFE (Local0, ^^PCI0.LPC0.EC0.BNBC, Zero)
                PBIF [0x0C] = Local0
                Return (Zero)
            }

            Name (PBST, Package (0x04)
            {
                Zero, 
                Ones, 
                Ones, 
                0x03E8
            })
            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (UPBS ())
                    {
                        PBST [Zero] = Zero
                        PBST [One] = Ones
                        PBST [0x02] = Ones
                        PBST [0x03] = 0x03E8
                    }
                }

                Return (PBST) /* \_SB_.BAT1.PBST */
            }

            Method (UPBS, 0, NotSerialized)
            {
                If (((^^PCI0.LPC0.EC0.BATL & One) == Zero))
                {
                    Return (0xFF)
                }

                Local0 = Zero
                If ((^^PCI0.LPC0.EC0.BATH & 0x0C))
                {
                    Local0 |= 0x02
                }
                ElseIf (((^^PCI0.LPC0.EC0.BATH & 0x0F) == One))
                {
                    Local0 |= One
                }

                PBST [Zero] = Local0
                Local1 = ^^PCI0.LPC0.EC0.BT1I /* \_SB_.PCI0.LPC0.EC0_.BT1I */
                If ((Local1 & 0x8000))
                {
                    Local1 |= 0xFFFF0000
                    Local1 = ((Ones - Local1) + One)
                }

                PBST [One] = Local1
                PBST [0x02] = ^^PCI0.LPC0.EC0.BT1C /* \_SB_.PCI0.LPC0.EC0_.BT1C */
                PBST [0x03] = ^^PCI0.LPC0.EC0.BT1V /* \_SB_.PCI0.LPC0.EC0_.BT1V */
                Return (Zero)
            }

            Method (GBFE, 3, NotSerialized)
            {
                CreateByteField (Arg0, Arg1, TIDX)
                Arg2 = TIDX /* \_SB_.BAT1.GBFE.TIDX */
            }

            Method (PBFE, 3, NotSerialized)
            {
                CreateByteField (Arg0, Arg1, TIDX)
                TIDX = Arg2
            }

            Method (ITOS, 1, NotSerialized)
            {
                Local0 = Buffer (0x09)
                    {
                        /* 0000 */  0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // 0.......
                        /* 0008 */  0x00                                             // .
                    }
                Local7 = Buffer (0x11)
                    {
                        "0123456789ABCDEF"
                    }
                Local1 = 0x08
                Local2 = Zero
                Local3 = Zero
                While (Local1)
                {
                    Local1--
                    Local4 = ((Arg0 >> (Local1 << 0x02)) & 0x0F)
                    If (Local4)
                    {
                        Local3 = Ones
                    }

                    If (Local3)
                    {
                        GBFE (Local7, Local4, RefOf (Local5))
                        PBFE (Local0, Local2, Local5)
                        Local2++
                    }
                }

                Return (Local0)
            }
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (^^PCI0.LPC0.EC0.LSTE)
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (One)
                    }
                }

                Return (One)
            }
        }
    }

    OperationRegion (DBGB, SystemIO, 0x80, One)
    Field (DBGB, ByteAcc, NoLock, Preserve)
    {
        P80B,   8
    }

    OperationRegion (DBGW, SystemIO, 0x80, 0x02)
    Field (DBGW, WordAcc, NoLock, Preserve)
    {
        P80W,   16
    }

    OperationRegion (DBGD, SystemIO, 0x80, 0x04)
    Field (DBGD, DWordAcc, NoLock, Preserve)
    {
        P80D,   32
    }

    Name (TSOS, 0x75)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            TSOS = 0x50
        }

        If (_OSI ("Windows 2015"))
        {
            TSOS = 0x70
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }

        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }

        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }

        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32, 
            Offset (0x62), 
            PVID,   16, 
            Offset (0x65), 
            SCUF,   8, 
            SXST,   8, 
            Offset (0x68), 
            STCO,   8
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
            SPIE,   1, 
            P80E,   1, 
                ,   2, 
            NI2C,   1, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
                ,   1, 
                ,   1, 
            ST_E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
                ,   3, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            Offset (0x08), 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
                ,   1, 
                ,   1, 
            ST_D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   4, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   2, 
            S03D,   1, 
            FW00,   16, 
            FW01,   32, 
            FW02,   16, 
            FW03,   32, 
            SDS0,   8, 
            SDS1,   8, 
            CZFG,   1, 
            Offset (0x20), 
            SD10,   32, 
            EH10,   32, 
            XH10,   32, 
            STBA,   32
        }

        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3044), 
            IPDE,   32, 
            IMPE,   32, 
            Offset (0xA306C), 
            RAR2,   32, 
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1, 
            Offset (0xA30D0), 
                ,   13, 
            LCLK,   2
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            IM17,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }

        OperationRegion (FMIS, SystemMemory, 0xFED80E00, 0x0100)
        Field (FMIS, AnyAcc, NoLock, Preserve)
        {
            Offset (0x40), 
                ,   13, 
            I24M,   1
        }

        OperationRegion (FGIO, SystemMemory, 0xFED81500, 0x0300)
        Field (FGIO, AnyAcc, NoLock, Preserve)
        {
            Offset (0x208), 
            Offset (0x20A), 
            I130,   1, 
            Offset (0x238), 
            Offset (0x23A), 
            I142,   1
        }

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x62), 
            AMTD,   2, 
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }

        OperationRegion (EMMX, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0xD0), 
                ,   17, 
            FC18,   1, 
            FC33,   1, 
                ,   7, 
            CD_T,   1, 
            WP_T,   1
        }

        OperationRegion (EMMB, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMB, AnyAcc, NoLock, Preserve)
        {
            Offset (0xA4), 
            E0A4,   32, 
            E0A8,   32, 
            Offset (0xB0), 
            E0B0,   32, 
            Offset (0xD0), 
            E0D0,   32, 
            Offset (0x116), 
            E116,   32
        }

        OperationRegion (SPIM, SystemMemory, 0xFEC10000, 0x0100)
        Field (SPIM, AnyAcc, NoLock, Preserve)
        {
            Offset (0x1D), 
            ASCE,   2, 
            Offset (0x22), 
            SSSC,   16, 
            Offset (0xFC), 
            STRN,   1, 
                ,   2, 
            BOWS,   1, 
            DOWS,   1
        }

        Mutex (ASSM, 0x00)
        Name (SVBF, Buffer (0x0100)
        {
             0x00                                             // .
        })
        CreateDWordField (SVBF, Zero, S0A4)
        CreateDWordField (SVBF, 0x04, S0A8)
        CreateDWordField (SVBF, 0x08, S0B0)
        CreateDWordField (SVBF, 0x0C, S0D0)
        CreateDWordField (SVBF, 0x10, S116)
        CreateWordField (SVBF, 0x14, RG22)
        CreateDWordField (SVBF, 0x18, SAR2)
        Method (SECR, 0, Serialized)
        {
            S116 = E116 /* \_SB_.E116 */
            RQTY = Zero
            RD28 = One
            Local0 = SD28 /* \_SB_.SD28 */
            While (Local0)
            {
                Local0 = SD28 /* \_SB_.SD28 */
            }
        }

        Method (RECR, 0, Serialized)
        {
            E116 = S116 /* \_SB_.S116 */
        }

        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }

        Method (FRUI, 1, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Return (IUA0) /* \_SB_.IUA0 */
            }

            If ((Arg0 == One))
            {
                Return (IUA1) /* \_SB_.IUA1 */
            }

            If ((Arg0 == 0x02))
            {
                Return (IUA2) /* \_SB_.IUA2 */
            }

            If ((Arg0 == 0x03))
            {
                Return (IUA3) /* \_SB_.IUA3 */
            }

            Return (Zero)
        }

        Method (OP80, 1, Serialized)
        {
            If (P80E)
            {
                P80D = Arg0
            }
        }

        Method (SRAD, 2, Serialized)
        {
            Local1 = (Arg1 << 0x05)
            Local1 += 0xB000AF80
            Local1 += Arg0
            OP80 (Local1)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
        {
            Local1 = (Arg1 << 0x05)
            Local1 += 0xB000AF80
            Local1 += Arg0
            OP80 (Local1)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        Method (HSAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    RQTY = One
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (!Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    RQTY = Zero
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }

                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }

        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            Offset (0xF8), 
            IUA2,   8, 
            IUA3,   8
        }

        Device (SPI1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (SPIE)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xFEC10000,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.SPI1._CRS.RBUF */
            }

            Method (ASSC, 2, Serialized)
            {
                Acquire (ASSM, 0xFFFF)
                Local0 = Arg1
                Switch (ToInteger (Arg0))
                {
                    Case (0x03)
                    {
                        DOWS = One
                        STRN = One
                        While ((BOWS && STRN))
                        {
                            If (Arg1)
                            {
                                Stall (One)
                                Local0 -= One
                                If ((Local0 == Zero))
                                {
                                    Break
                                }
                            }
                        }

                        SAR2 = RAR2 /* \_SB_.RAR2 */
                        RAR2 = Zero
                        ASCE = 0x02
                        RG22 = SSSC /* \_SB_.SSSC */
                    }
                    Case (0x04)
                    {
                        SSSC = RG22 /* \_SB_.RG22 */
                        ASCE = Zero
                        RAR2 = SAR2 /* \_SB_.SAR2 */
                        Local0 = One
                        DOWS = Zero
                    }

                }

                Release (ASSM)
                Return (Local0)
            }
        }

        Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000007,
                    }
                    Memory32Fixed (ReadWrite,
                        0xFED81500,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

            Method (RST, 0, NotSerialized)
            {
                Notify (GPIO, Zero) // Bus Check
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR0)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {3}
                Memory32Fixed (ReadWrite,
                    0xFEDC9000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC7000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT0E == One))
                    {
                        If (UOL0)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT0D && UT0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT0D && UT0E))
                {
                    DSAD (0x0B, 0x03)
                }
            }
        }

        Device (FUR1)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
                Memory32Fixed (ReadWrite,
                    0xFEDCA000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC8000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT1E == One))
                    {
                        If (UOL1)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT1D && UT1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT1D && UT1E))
                {
                    DSAD (0x0C, 0x03)
                }
            }
        }

        Device (FUR2)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {15}
                Memory32Fixed (ReadWrite,
                    0xFEDCE000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCC000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT2E == One))
                    {
                        If (UOL2)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT2D && UT2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT2D && UT2E))
                {
                    DSAD (0x10, 0x03)
                }
            }
        }

        Device (FUR3)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {5}
                Memory32Fixed (ReadWrite,
                    0xFEDCF000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCD000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT3E == One))
                    {
                        If (UOL3)
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((UT3D && UT3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((UT3D && UT3E))
                {
                    DSAD (0x1A, 0x03)
                }
            }
        }

        Device (I2CA)
        {
            Name (_HID, "AMDI0011")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_ADR, Zero)  // _ADR: Address
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {10}
                Memory32Fixed (ReadWrite,
                    0xFEDC2000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                ^PCI0.GP17.MP2C
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        If ((NI2C == Zero))
                        {
                            Return (0x0F)
                        }
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }
        }

        Device (I2CB)
        {
            Name (_HID, "AMDI0011")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_ADR, One)  // _ADR: Address
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {11}
                Memory32Fixed (ReadWrite,
                    0xFEDC3000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                ^PCI0.GP17.MP2C
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        If ((NI2C == Zero))
                        {
                            Return (0x0F)
                        }
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }
        }

        Device (I2CC)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {14}
                Memory32Fixed (ReadWrite,
                    0xFEDC4000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC2E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC2D && IC2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC2D && IC2E))
                {
                    DSAD (0x07, 0x03)
                }
            }
        }

        Device (I2CD)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {6}
                Memory32Fixed (ReadWrite,
                    0xFEDC5000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC3E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((IC3D && IC3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, Zero)
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((IC3D && IC3E))
                {
                    DSAD (0x08, 0x03)
                }
            }
        }

        Device (I2CE)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {10}
                Memory32Fixed (ReadWrite,
                    0xFEDC2000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        If ((NI2C == One))
                        {
                            Return (0x0F)
                        }
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x09, 0xC8)
            }
        }

        Device (I2CF)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {11}
                Memory32Fixed (ReadWrite,
                    0xFEDC3000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        If ((NI2C == One))
                        {
                            Return (0x0F)
                        }
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0A, 0xC8)
            }
        }

        Method (EPIN, 0, NotSerialized)
        {
            IPDE = Zero
            IMPE = 0xFF00
            IM15 = One
            IM16 = One
            IM20 = One
            IM44 = One
            IM46 = One
            IM68 = One
            IM69 = One
            IM6A = One
            IM6B = One
            IM1F = One
            If ((EMMD != One))
            {
                IM4A = One
                IM58 = One
                IM4B = One
                IM57 = One
                IM6D = One
            }

            SECR ()
        }

        Name (NCRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000005,
            }
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
        })
        Name (DCRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000005,
            }
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
            GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x0BB8,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0044
                }
            GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0044
                }
        })
        Name (ECRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
            {
                0x00000005,
            }
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
            GpioInt (Edge, ActiveLow, SharedAndWake, PullUp, 0x0BB8,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   // Pin list
                    0x0044
                }
        })
        Name (AHID, "AMDI0040")
        Name (ACID, "AMDI0040")
        Name (MHID, "AMDI0041")
        Name (MCID, "AMDI0041")
        Name (SHID, 0x400DD041)
        Name (SCID, "PCI\\CC_080501")
        Device (EMM0)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If ((EMMD == Zero))
                {
                    Return (AHID) /* \_SB_.AHID */
                }

                If ((EMMD == One))
                {
                    Return (SHID) /* \_SB_.SHID */
                }

                If ((EMMD == 0x02))
                {
                    Return (MHID) /* \_SB_.MHID */
                }

                Return (Zero)
            }

            Method (_CID, 0, Serialized)  // _CID: Compatible ID
            {
                If ((EMMD == Zero))
                {
                    Return (ACID) /* \_SB_.ACID */
                }

                If ((EMMD == One))
                {
                    Return (SCID) /* \_SB_.SCID */
                }

                If ((EMMD == 0x02))
                {
                    Return (MCID) /* \_SB_.MCID */
                }

                Return (Zero)
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (EMD3)
                {
                    If ((EMMD == One))
                    {
                        Return (DCRS) /* \_SB_.DCRS */
                    }

                    Return (ECRS) /* \_SB_.ECRS */
                }
                Else
                {
                    Return (NCRS) /* \_SB_.NCRS */
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If (EMME)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (EMME)
                {
                    EPIN ()
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((EMD3 && EMME))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, Zero)
                    RECR ()
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, 0x03)
                }
            }

            Device (CARD)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    If ((EMMD == One))
                    {
                        Return (One)
                    }

                    Return (Zero)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((IER0 && (AMTD != 0x03)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y09)
                    IRQNoFlags (_Y0A)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR1._CRS._Y0A._INT, IRQL)  // _INT: Interrupts
                IRQL = (One << FRUI (WUR0))
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((IER1 && (AMTD != 0x03)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02F8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0B)
                    IRQNoFlags (_Y0C)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR2._CRS._Y0C._INT, IRQL)  // _INT: Interrupts
                IRQL = (One << FRUI (WUR1))
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((IER2 && (AMTD != 0x03)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0D)
                    IRQNoFlags (_Y0E)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR3._CRS._Y0E._INT, IRQL)  // _INT: Interrupts
                IRQL = (One << FRUI (WUR2))
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((IER3 && (AMTD != 0x03)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03F8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0F)
                    IRQNoFlags (_Y10)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MIN, IOLO)  // _MIN: Minimum Base Address
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MAX, IORL)  // _MAX: Maximum Base Address
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR4._CRS._Y10._INT, IRQL)  // _INT: Interrupts
                IRQL = (One << FRUI (WUR3))
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_SB.I2CC)
    {
        Device (GSEN)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "SMO8840")  // _HID: Hardware ID
            Name (_CID, "SMO8840")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((M009 == 0x82))
                {
                    One
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0018, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Edge, ActiveHigh, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0054
                        }
                })
                Return (SBUF) /* \_SB_.I2CC.GSEN._CRS.SBUF */
            }
        }
    }

    Scope (_SB.I2CD)
    {
        Device (TPDD)
        {
            Name (_HID, "ELAN2204")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0009
                        }
                })
                Return (RBUF) /* \_SB_.I2CD.TPDD._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (THPD == 0x04)))
                {
                    If ((PVID == 0x04F3))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                If (Arg0) {}
                Else
                {
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Switch (ToInteger (Arg1))
                            {
                                Case (One)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                        Case (One)
                        {
                            Return (One)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB.I2CD)
    {
        Device (TPDS)
        {
            Name (_HID, "06CBCDC2")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0009
                        }
                })
                Return (RBUF) /* \_SB_.I2CD.TPDS._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (THPD == 0x04)))
                {
                    If ((PVID == 0x06CB))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
                If (Arg0) {}
                Else
                {
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Switch (ToInteger (Arg1))
                            {
                                Case (One)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }
                                Default
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                }

                            }
                        }
                        Case (One)
                        {
                            Return (0x20)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (_SB)
    {
        Device (BTFD)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, EisaId ("BTF0001"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((RDCM (0x6D) == 0xFD))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (SBTO, 2, Serialized)
            {
                M010 (0x18, Zero)
                Sleep (0x64)
                M010 (0x18, One)
            }
        }
    }
}

