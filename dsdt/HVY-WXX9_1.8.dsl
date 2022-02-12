/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210604 (64-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of dsdt.dat, Sat Feb 12 07:32:03 2022
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000086DD (34525)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x62
 *     OEM ID           "HUAWEI"
 *     OEM Table ID     "EDK2    "
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "    "
 *     Compiler Version 0x01000013 (16777235)
 */
DefinitionBlock ("", "DSDT", 1, "HUAWEI", "EDK2    ", 0x00000002)
{
    /*
     * iASL Warning: There were 8 external control methods found during
     * disassembly, but only 0 were resolved (8 unresolved). Additional
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
    External (_SB_.APTS, MethodObj)    // Warning: Unknown method, guessing 3 arguments
    External (_SB_.AWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.PCI0.GPP0.PEGP, UnknownObj)
    External (_SB_.TPM2.PTS_, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN4, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN7, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (ALIB, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (DAIN, UnknownObj)
    External (DAOU, IntObj)
    External (MPTS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (MWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (WMI0, UnknownObj)

    OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (HSMI, 0, NotSerialized)
    {
        SSMP = 0xC1
    }

    Method (GVER, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, INTV)
        CreateByteField (BUFF, 0x03, DECV)
        STAT = Zero
        INTV = One
        DECV = 0x10
        Return (BUFF) /* \GVER.BUFF */
    }

    Method (GTSI, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        CreateQWordField (BUFF, One, TSIF)
        TSIF = 0x0060C9E3
        Return (BUFF) /* \GTSI.BUFF */
    }

    Method (GTMP, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        CreateByteField (BUFF, One, SIGN)
        CreateByteField (BUFF, 0x02, TEM1)
        CreateByteField (BUFF, 0x03, TEM2)
        CreateByteField (Arg0, 0x02, SNUM)
        Switch (ToInteger (SNUM))
        {
            Case (Zero)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP00
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (One)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP01
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x05)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP08
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x06)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP06
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x07)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP02
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x08)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP03
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x0B)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP05
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x0E)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.BTEM
                Local0 -= 0x0AAA
                Local0 /= 0x0A
                TEM1 = Local0
            }
            Case (0x0F)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP0C
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x15)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP07
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Case (0x16)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.TP04
                If ((Local0 & 0x80))
                {
                    SIGN = One
                    Local0 ^= 0xFF
                    Local0 += One
                }

                TEM1 = Local0
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \GTMP.BUFF */
    }

    Method (STMT, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateWordField (Arg0, 0x02, SSNB)
        CreateByteField (Arg0, 0x04, SINU)
        CreateByteField (Arg0, 0x05, ULTT)
        CreateByteField (Arg0, 0x06, SINL)
        CreateByteField (Arg0, 0x07, LLTT)
        STAT = Zero
        If (((SINU > One) || (SINL > One)))
        {
            STAT = One
            Return (BUFF) /* \STMT.BUFF */
        }
        ElseIf ((SINU == SINL))
        {
            If ((SINU == One))
            {
                If ((ULTT > LLTT))
                {
                    STAT = One
                    Return (BUFF) /* \STMT.BUFF */
                }
            }
            ElseIf ((LLTT > ULTT))
            {
                STAT = One
                Return (BUFF) /* \STMT.BUFF */
            }
        }
        ElseIf ((SINU > SINL))
        {
            STAT = One
            Return (BUFF) /* \STMT.BUFF */
        }

        If ((SINU == Zero))
        {
            Local0 = ULTT /* \STMT.ULTT */
        }
        Else
        {
            Local0 = ULTT /* \STMT.ULTT */
            Local0 ^= 0xFF
            Local0 += One
        }

        If ((SINL == Zero))
        {
            Local1 = LLTT /* \STMT.LLTT */
        }
        Else
        {
            Local1 = LLTT /* \STMT.LLTT */
            Local1 ^= 0xFF
            Local1 += One
        }

        Local2 = Zero
        Local3 = Zero
        Switch (ToInteger (SSNB))
        {
            Case (Zero)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A50, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A51, Local1)
                \_SB.PCI0.LPC0.EC0.CPOF = One
                \_SB.PCI0.LPC0.EC0.CPUF = One
            }
            Case (One)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A52, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A53, Local1)
                \_SB.PCI0.LPC0.EC0.GPOF = One
                \_SB.PCI0.LPC0.EC0.GPUF = One
            }
            Case (0x05)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5A, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5B, Local1)
                \_SB.PCI0.LPC0.EC0.SCOF = One
                \_SB.PCI0.LPC0.EC0.SCUF = One
            }
            Case (0x06)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4E, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4F, Local1)
                Local2 = \_SB.PCI0.LPC0.EC0.RDER (0x262C)
                \_SB.PCI0.LPC0.EC0.WTER (0x262C, Local2 |= 0x08)
                Local3 = \_SB.PCI0.LPC0.EC0.RDER (0x262D)
                \_SB.PCI0.LPC0.EC0.WTER (0x262D, Local3 |= 0x08)
            }
            Case (0x07)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A54, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A55, Local1)
                \_SB.PCI0.LPC0.EC0.TCOF = One
                \_SB.PCI0.LPC0.EC0.TCUF = One
            }
            Case (0x08)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A56, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A57, Local1)
                \_SB.PCI0.LPC0.EC0.CGOF = One
                \_SB.PCI0.LPC0.EC0.CGUF = One
            }
            Case (0x0B)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5E, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5F, Local1)
                \_SB.PCI0.LPC0.EC0.DROF = One
                \_SB.PCI0.LPC0.EC0.DRUF = One
            }
            Case (0x0E)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4C, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4D, Local1)
                \_SB.PCI0.LPC0.EC0.BAOF = One
                \_SB.PCI0.LPC0.EC0.BAUF = One
            }
            Case (0x0F)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4A, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A4B, Local1)
                \_SB.PCI0.LPC0.EC0.AMOF = One
                \_SB.PCI0.LPC0.EC0.AMUF = One
            }
            Case (0x15)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A58, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A59, Local1)
                Local2 = \_SB.PCI0.LPC0.EC0.RDER (0x262C)
                \_SB.PCI0.LPC0.EC0.WTER (0x262C, Local2 |= 0x02)
                Local3 = \_SB.PCI0.LPC0.EC0.RDER (0x262D)
                \_SB.PCI0.LPC0.EC0.WTER (0x262D, Local3 |= 0x02)
            }
            Case (0x16)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5C, Local0)
                \_SB.PCI0.LPC0.EC0.WTER (0x2A5D, Local1)
                Local2 = \_SB.PCI0.LPC0.EC0.RDER (0x262C)
                \_SB.PCI0.LPC0.EC0.WTER (0x262C, Local2 |= 0x04)
                Local3 = \_SB.PCI0.LPC0.EC0.RDER (0x262D)
                \_SB.PCI0.LPC0.EC0.WTER (0x262D, Local3 |= 0x04)
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \STMT.BUFF */
    }

    Method (GPSI, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        CreateByteField (BUFF, One, CPSI)
        CPSI = 0x05
        Return (BUFF) /* \GPSI.BUFF */
    }

    Method (GPCI, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        CreateByteField (BUFF, One, PWVU)
        CreateByteField (Arg0, 0x02, PWSN)
        Switch (ToInteger (PWSN))
        {
            Case (Zero)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.ACCH
                Local0 <<= 0x08
                Local0 |= \_SB.PCI0.LPC0.EC0.ACCL
                If ((\_SB.PCI0.LPC0.EC0.RDER (0x2232) > Zero))
                {
                    Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2232)
                    Local1 <<= 0x08
                    Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2231)
                    Local1 *= 0x32
                }
                Else
                {
                    Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2332)
                    Local1 <<= 0x08
                    Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2331)
                    Local1 *= 0x32
                }

                Local0 *= Local1
                Local0 /= 0x000F4240
                PWVU = Local0
            }
            Case (0x02)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.BAPR
                If ((Local0 & 0x8000))
                {
                    Local0 &= 0x7FFF
                    Local0 = (0x8000 - Local0)
                }

                Local1 = \_SB.PCI0.LPC0.EC0.BAPV
                Local0 *= Local1
                Local0 /= 0x000F4240
                PWVU = Local0
            }
            Default
            {
                PWVU = Zero
                STAT = One
            }

        }

        Return (BUFF) /* \GPCI.BUFF */
    }

    Method (SLIV, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (Arg0, 0x02, SKBL)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Switch (ToInteger (SKBL))
        {
            Case (Zero)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2454, Zero)
                \_SB.PCI0.LPC0.EC0.WTER (0x2450, Zero)
                \_SB.PCI0.LPC0.EC0.WTER (0x2451, 0x04)
            }
            Case (0x02)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2454, One)
                \_SB.PCI0.LPC0.EC0.WTER (0x2451, 0x04)
            }
            Case (0x04)
            {
                \_SB.PCI0.LPC0.EC0.WTER (0x2454, 0x02)
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \SLIV.BUFF */
    }

    Method (GFNS, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (Arg0, 0x02, FANN)
        CreateByteField (BUFF, Zero, STAT)
        CreateWordField (BUFF, One, FANS)
        STAT = Zero
        Switch (ToInteger (FANN))
        {
            Case (Zero)
            {
                Local1 = (\_SB.PCI0.LPC0.EC0.RDER (0x2A01) << 0x08)
                Local2 = (\_SB.PCI0.LPC0.EC0.RDER (0x2A00) | Local1)
                FANS = Local2
            }
            Case (One)
            {
                Local1 = (\_SB.PCI0.LPC0.EC0.RDER (0x2A03) << 0x08)
                Local2 = (\_SB.PCI0.LPC0.EC0.RDER (0x2A02) | Local1)
                FANS = Local2
            }
            Default
            {
                FANS = Zero
                STAT = One
            }

        }

        Return (BUFF) /* \GFNS.BUFF */
    }

    Method (GCVA, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (Arg0, 0x02, INUM)
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, SIGN)
        CreateByteField (BUFF, 0x02, LVAL)
        CreateByteField (BUFF, 0x03, UVAL)
        Switch (ToInteger (INUM))
        {
            Case (Zero)
            {
                Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2232)
                Local1 <<= 0x08
                Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2231)
                Local1 *= 0x32
                UVAL = (Local1 >> 0x08)
                UVAL &= 0xFF
                LVAL = (Local1 & 0xFF)
                STAT = Zero
            }
            Case (One)
            {
                Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2332)
                Local1 <<= 0x08
                Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2331)
                Local1 *= 0x32
                UVAL = (Local1 >> 0x08)
                UVAL &= 0xFF
                LVAL = (Local1 & 0xFF)
                STAT = Zero
            }
            Case (0x10)
            {
                Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2234)
                Local1 <<= 0x08
                Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2233)
                Local1 *= 0x0A
                UVAL = (Local1 >> 0x08)
                UVAL &= 0xFF
                LVAL = (Local1 & 0xFF)
                STAT = Zero
            }
            Case (0x11)
            {
                Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2334)
                Local1 <<= 0x08
                Local1 |= \_SB.PCI0.LPC0.EC0.RDER (0x2333)
                Local1 *= 0x0A
                UVAL = (Local1 >> 0x08)
                UVAL &= 0xFF
                LVAL = (Local1 & 0xFF)
                STAT = Zero
            }
            Case (0x20)
            {
                UVAL = \_SB.PCI0.LPC0.EC0.RDER (0x0791)
                LVAL = \_SB.PCI0.LPC0.EC0.RDER (0x0790)
                STAT = Zero
            }
            Case (0x30)
            {
                Local0 = \_SB.PCI0.LPC0.EC0.RDER (0x2C28)
                Local1 = \_SB.PCI0.LPC0.EC0.RDER (0x2C27)
                Local0 <<= 0x08
                Local0 += Local1
                If ((Local0 & 0x8000))
                {
                    SIGN = One
                    Local0 ^= 0xFFFF
                    Local0 += One
                }

                UVAL = (Local0 >> 0x08)
                LVAL = (Local0 & 0xFF)
                STAT = Zero
            }
            Default
            {
                UVAL = Zero
                LVAL = Zero
                STAT = One
            }

        }

        Return (BUFF) /* \GCVA.BUFF */
    }

    Method (GFRQ, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GFRQ.BUFF */
    }

    Method (STMP, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, SNUM)
        CreateByteField (Arg0, 0x03, SMOD)
        CreateByteField (Arg0, 0x04, SIGN)
        CreateByteField (Arg0, 0x05, TEM1)
        CreateByteField (Arg0, 0x06, TEM2)
        STAT = Zero
        If ((SMOD == Zero))
        {
            Return (BUFF) /* \STMP.BUFF */
        }

        If ((SIGN == Zero))
        {
            Local0 = TEM1 /* \STMP.TEM1 */
        }
        ElseIf ((SIGN == One))
        {
            Local0 = ((TEM1 - One) ^ 0xFF)
        }
        Else
        {
            STAT = One
            Return (BUFF) /* \STMP.BUFF */
        }

        Switch (ToInteger (SNUM))
        {
            Case (Zero)
            {
                \_SB.PCI0.LPC0.EC0.TP00 = Local0
            }
            Case (One)
            {
                \_SB.PCI0.LPC0.EC0.TP01 = Local0
            }
            Case (0x05)
            {
                \_SB.PCI0.LPC0.EC0.TP08 = Local0
            }
            Case (0x06)
            {
                \_SB.PCI0.LPC0.EC0.TP06 = Local0
            }
            Case (0x07)
            {
                \_SB.PCI0.LPC0.EC0.TP02 = Local0
            }
            Case (0x08)
            {
                \_SB.PCI0.LPC0.EC0.TP03 = Local0
            }
            Case (0x0B)
            {
                \_SB.PCI0.LPC0.EC0.TP05 = Local0
            }
            Case (0x0E)
            {
                Local0 <<= 0x08
                Local0 |= TEM2 /* \STMP.TEM2 */
                \_SB.PCI0.LPC0.EC0.BTEM = Local0
            }
            Case (0x0F)
            {
                \_SB.PCI0.LPC0.EC0.TP0C = Local0
            }
            Case (0x15)
            {
                \_SB.PCI0.LPC0.EC0.TP07 = Local0
            }
            Case (0x16)
            {
                \_SB.PCI0.LPC0.EC0.TP04 = Local0
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \STMP.BUFF */
    }

    Method (SPSL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SPSL.BUFF */
    }

    Method (RDTB, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \RDTB.BUFF */
    }

    Method (STTB, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \STTB.BUFF */
    }

    Method (GHWP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GHWP.BUFF */
    }

    Method (SHWP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SHWP.BUFF */
    }

    Method (GEEP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GEEP.BUFF */
    }

    Method (SEEP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SEEP.BUFF */
    }

    Method (GTDP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GTDP.BUFF */
    }

    Method (STDP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \STDP.BUFF */
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
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (Arg0, 0x02, TCPV)
        CreateByteField (Arg0, 0x03, PCPV)
        STAT = Zero
        If ((((PCPV <= 0x64) && (TCPV >= Zero)) && (
            PCPV > TCPV)))
        {
            \_SB.PCI0.LPC0.EC0.ECCC (0x82, TCPV, PCPV, Zero)
        }
        Else
        {
            STAT = One
        }

        Return (BUFF) /* \SBTT.BUFF */
    }

    Method (GBTT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, TCPV)
        CreateByteField (BUFF, 0x02, PCPV)
        STAT = Zero
        TCPV = \_SB.PCI0.LPC0.EC0.STCP
        PCPV = \_SB.PCI0.LPC0.EC0.SPCP
        Return (BUFF) /* \GBTT.BUFF */
    }

    Method (STSL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \STSL.BUFF */
    }

    Method (GGDS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GGDS.BUFF */
    }

    Method (SCRP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \SCRP.BUFF */
    }

    Method (PAFS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \PAFS.BUFF */
    }

    Method (PAFF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \PAFF.BUFF */
    }

    Method (GFRS, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (BUFF, Zero, STAT)
        CreateByteField (BUFF, One, FKRS)
        STAT = Zero
        If (\_SB.PCI0.LPC0.EC0.FNST)
        {
            FKRS = 0x02
        }
        Else
        {
            FKRS = One
        }

        Return (BUFF) /* \GFRS.BUFF */
    }

    Method (SFRS, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (Arg0, 0x02, FKRR)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Switch (ToInteger (FKRR))
        {
            Case (One)
            {
                \_SB.PCI0.LPC0.EC0.ECCC (0x46, 0xA1, Zero, Zero)
            }
            Case (0x02)
            {
                \_SB.PCI0.LPC0.EC0.ECCC (0x46, 0xA0, Zero, Zero)
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \SFRS.BUFF */
    }

    Method (SPDT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \SPDT.BUFF */
    }

    Method (RPDT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \RPDT.BUFF */
    }

    Method (RPPT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \RPPT.BUFF */
    }

    Method (SMLS, 1, Serialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        CreateByteField (Arg0, 0x02, MLSR)
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Switch (ToInteger (MLSR))
        {
            Case (Zero)
            {
                \_SB.PCI0.LPC0.EC0.ECCC (0x48, 0xA1, Zero, Zero)
            }
            Case (One)
            {
                \_SB.PCI0.LPC0.EC0.ECCC (0x48, 0xA0, Zero, Zero)
            }
            Default
            {
                STAT = One
            }

        }

        Return (BUFF) /* \SMLS.BUFF */
    }

    Method (GSTP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GSTP.BUFF */
    }

    Method (SSTP, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SSTP.BUFF */
    }

    Method (SLGO, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
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
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GLGO.BUFF */
    }

    Method (GLOG, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GLOG.BUFF */
    }

    Method (GNTB, 1, NotSerialized)
    {
        DAIN = Arg0
        HSMI ()
        Return (DAOU) /* External reference */
    }

    Method (SNTB, 1, NotSerialized)
    {
        DAIN = Arg0
        HSMI ()
        Return (DAOU) /* External reference */
    }

    Method (GSWL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GSWL.BUFF */
    }

    Method (GECL, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GECL.BUFF */
    }

    Method (SPDV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \SPDV.BUFF */
    }

    Method (GPDV, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GPDV.BUFF */
    }

    Method (SOSF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \SOSF.BUFF */
    }

    Method (GOSF, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        Return (BUFF) /* \GOSF.BUFF */
    }

    Method (SKBT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \SKBT.BUFF */
    }

    Method (GKBT, 1, NotSerialized)
    {
        Name (BUFF, Buffer (0x0100) {})
        Local0 = Arg0
        CreateByteField (BUFF, Zero, STAT)
        STAT = Zero
        DAIN = Local0
        HSMI ()
        BUFF = DAOU /* External reference */
        Return (BUFF) /* \GKBT.BUFF */
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

    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x5C), 
        Offset (0x5E), 
        GS23,   1, 
            ,   5, 
        GV23,   1, 
        GE23,   1, 
        Offset (0xA0), 
        Offset (0xA2), 
        GS40,   1, 
            ,   5, 
        GV40,   1, 
        GE40,   1
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

    OperationRegion (GNVS, SystemMemory, 0xCDF60A98, 0x00000189)
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
        HML2,   64, 
        WOVS,   8
    }

    OperationRegion (OGNS, SystemMemory, 0xCDF60D18, 0x0000000D)
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
        TBEN,   8, 
        TBNH,   8, 
        RV2I,   8, 
        ISDS,   8, 
        CNRG,   8
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
    OperationRegion (MDBG, SystemMemory, 0xCDEF6018, 0x00001004)
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

    OperationRegion (HQNV, SystemMemory, 0xCCF7DB18, 0x00E4)
    Field (HQNV, AnyAcc, Lock, Preserve)
    {
        EDID,   1024, 
        HQRS,   800
    }

    Scope (_SB)
    {
        Device (PLTF)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A05") /* Generic Container Device */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Device (C000)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (C001)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (C002)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
            }

            Device (C003)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
            }

            Device (C004)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
            }

            Device (C005)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
            }

            Device (C006)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
            }

            Device (C007)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
            }

            Device (C008)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
            }

            Device (C009)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
            }

            Device (C00A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
            }

            Device (C00B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
            }

            Device (C00C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
            }

            Device (C00D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
            }

            Device (C00E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
            }

            Device (C00F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
            }
        }
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
        Method (XL08, 0, NotSerialized)
        {
            TPST (0x3908)
            If ((TBEN == Zero))
            {
                Notify (\_SB.PCI0.GPP0, 0x02) // Device Wake
                Notify (\_SB.PCI0.GPP1, 0x02) // Device Wake
            }

            Notify (\_SB.PCI0.GPP5, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP18, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (XL0D, 0, NotSerialized)
        {
            TPST (0x390D)
            Notify (\_SB.PCI0.GPP2, 0x02) // Device Wake
        }

        Method (XL0E, 0, NotSerialized)
        {
            TPST (0x390E)
            Notify (\_SB.PCI0.GPP4, 0x02) // Device Wake
        }

        Method (XL0F, 0, NotSerialized)
        {
            TPST (0x390F)
            Notify (\_SB.PCI0.GPP3, 0x02) // Device Wake
        }

        Method (XL19, 0, NotSerialized)
        {
            TPST (0x3919)
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

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x51)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x53)
            SLPS = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x54)
            SLPS = One
            RSTU = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x55)
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
        SWAK (Arg0)
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
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0xE3)
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0xE4)
        }

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
                    If ((TBEN == One))
                    {
                        If ((TBNH != Zero))
                        {
                            CTRL &= 0xFFFFFFF5
                        }
                        Else
                        {
                            CTRL &= 0xFFFFFFF4
                        }
                    }

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

            Name (PR00, Package (0x0E)
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
                    0x0002FFFF, 
                    Zero, 
                    LNKE, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKF, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKG, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKH, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    LNKC, 
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
            Name (AR00, Package (0x0E)
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
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x12
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
            Name (NR00, Package (0x0E)
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
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x24
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x25
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x26
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x27
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x22
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
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (MPRW, 0, NotSerialized)
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
                        Return (GPRW (0x0D, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x0D, Zero))
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

                Device (WWAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x0F, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x0F, Zero))
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

                Device (RTL8)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }

                Device (RUSB)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x0E, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x0E, Zero))
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

                Device (BTH0)
                {
                    Name (_HID, "QCOM6390")  // _HID: Hardware ID
                    Name (_S4W, 0x02)  // _S4W: S4 Device Wake State
                    Name (_S0W, 0x02)  // _S0W: S0 Device Wake State
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If ((BLTH == Zero))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (UBUF, ResourceTemplate ()
                        {
                            UartSerialBusV2 (0x0001C200, DataBitsEight, StopBitsOne,
                                0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                                0x0020, 0x0020, "\\_SB.FUR0",
                                0x00, ResourceConsumer, , Exclusive,
                                )
                            GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x0003
                                }
                        })
                        Return (UBUF) /* \_SB_.PCI0.GPP4.BTH0._CRS.UBUF */
                    }
                }
            }

            Device (GPP5)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
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

                Device (DEV0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP6)
            {
                Name (_ADR, 0x00020004)  // _ADR: Address
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
                Method (MPRW, 0, NotSerialized)
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
                Name (AR17, Package (0x04)
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
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
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

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x19, 0x03))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (GPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10) {}
                            })
                            CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                            REV = 0x02
                            CreateField (DerefOf (PCKG [Zero]), 0x07, One, RGB)
                            RGB = One
                            CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                            VISI = Arg0
                            CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                            GPOS = Arg1
                            Return (PCKG) /* \_SB_.PCI0.GP17.XHC0.RHUB.GPLD.PCKG */
                        }

                        Method (GUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            PCKG [Zero] = Arg0
                            PCKG [One] = Arg1
                            Return (PCKG) /* \_SB_.PCI0.GP17.XHC0.RHUB.GUPC.PCKG */
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x09))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, One))
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x03))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x02))
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (Zero, 0xFF))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (Zero, 0x03))
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (0xFF, 0xFF))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (Zero, 0x04))
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x09))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, One))
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x03))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x02))
                            }
                        }
                    }
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x19, 0x03))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Method (GPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10) {}
                            })
                            CreateField (DerefOf (PCKG [Zero]), Zero, 0x07, REV)
                            REV = 0x02
                            CreateField (DerefOf (PCKG [Zero]), 0x07, One, RGB)
                            RGB = One
                            CreateField (DerefOf (PCKG [Zero]), 0x40, One, VISI)
                            VISI = Arg0
                            CreateField (DerefOf (PCKG [Zero]), 0x57, 0x08, GPOS)
                            GPOS = Arg1
                            Return (PCKG) /* \_SB_.PCI0.GP17.XHC1.RHUB.GPLD.PCKG */
                        }

                        Method (GUPC, 2, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            PCKG [Zero] = Arg0
                            PCKG [One] = Arg1
                            Return (PCKG) /* \_SB_.PCI0.GP17.XHC1.RHUB.GUPC.PCKG */
                        }

                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x09))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x05))
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x03))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x06))
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (0xFF, 0xFF))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (Zero, 0x07))
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (0xFF, 0xFF))
                            }

                            Name (PLD1, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                    /* 0008 */  0x24, 0x1D, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // $.......
                                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                }
                            })
                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.PLD1 */
                            }

                            Device (CAM1)
                            {
                                Name (_ADR, 0x04)  // _ADR: Address
                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Name (PLDP, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                                            /* 0008 */  0x24, 0x1D, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,  // $.......
                                            /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                                        }
                                    })
                                    Return (PLDP) /* \_SB_.PCI0.GP17.XHC1.RHUB.PRT4.CAM1._PLD.PLDP */
                                }
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x09))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x05))
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (GUPC (One, 0x03))
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (GPLD (One, 0x06))
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
                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, 
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
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x21
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

                Device (SAT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (GP19)
            {
                Name (_ADR, 0x00080003)  // _ADR: Address
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

                Name (PR19, Package (0x04)
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
                Name (AR19, Package (0x04)
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
                Name (NR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR19) /* \_SB_.PCI0.GP19.NR19 */
                        }
                        Else
                        {
                            Return (AR19) /* \_SB_.PCI0.GP19.AR19 */
                        }
                    }
                    Else
                    {
                        Return (PR19) /* \_SB_.PCI0.GP19.PR19 */
                    }
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
                    Name (_HID, EisaId ("FUJ7401"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
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
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (OKEC, Zero)
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (BUF0, ResourceTemplate ()
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
                        Return (BUF0) /* \_SB_.PCI0.LPC0.EC0_._CRS.BUF0 */
                    }

                    Method (_GPE, 0, NotSerialized)  // _GPE: General Purpose Events
                    {
                        Local0 = 0x03
                        Return (Local0)
                    }

                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        If ((_REV >= 0x02))
                        {
                            OKEC = One
                            Return (Zero)
                        }
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If ((Arg0 == 0x03))
                        {
                            OKEC = Arg1
                            Notify (ACAD, 0x80) // Status Change
                            Notify (BAT0, 0x80) // Status Change
                            Notify (BAT0, 0x81) // Information Change
                            Notify (LID, 0x80) // Status Change
                        }
                    }

                    Method (ECRD, 1, Serialized)
                    {
                        Local0 = Acquire (Z009, 0x03E8)
                        If ((Local0 == Zero))
                        {
                            If (ECOK ())
                            {
                                Local1 = DerefOf (Arg0)
                                Release (Z009)
                                Return (Local1)
                            }
                            Else
                            {
                                Release (Z009)
                            }
                        }

                        Return (Zero)
                    }

                    Method (ECWT, 2, Serialized)
                    {
                        Local0 = Acquire (Z009, 0x03E8)
                        If ((Local0 == Zero))
                        {
                            If (ECOK ())
                            {
                                Arg1 = Arg0
                            }

                            Release (Z009)
                        }
                    }

                    Method (RDER, 1, Serialized)
                    {
                        Local0 = Acquire (QEVT, 0x07D0)
                        If ((Local0 == Zero))
                        {
                            Local1 = Arg0
                            Local1 &= 0xFF
                            Local2 = (Arg0 >> 0x08)
                            Local2 &= 0xFF
                            DAT0 = Local2
                            DAT1 = Local1
                            NUMB = One
                            CMDB = 0x80
                            Local0 = 0x0100
                            While ((Local0 && CMDB))
                            {
                                Sleep (0x02)
                                Local0--
                            }

                            If ((CMDB == Zero))
                            {
                                Local0 = DAT0 /* \_SB_.PCI0.LPC0.EC0_.DAT0 */
                            }
                            Else
                            {
                                Local0 = 0xFF
                            }

                            Release (QEVT)
                            Return (Local0)
                        }

                        Release (QEVT)
                        Return (0xFF)
                    }

                    Method (WTER, 2, Serialized)
                    {
                        Local0 = Acquire (QEVT, 0x07D0)
                        If ((Local0 == Zero))
                        {
                            DAT0 = 0x4D
                            CMDB = 0x29
                            Local0 = 0x0100
                            While ((Local0 && CMDB))
                            {
                                Sleep (0x02)
                                Local0--
                            }

                            If ((CMDB != Zero))
                            {
                                Local0 = 0xFF
                                Release (QEVT)
                                Return (Local0)
                            }

                            Local1 = Arg0
                            Local1 &= 0xFF
                            Local2 = (Arg0 >> 0x08)
                            Local2 &= 0xFF
                            DAT0 = Local2
                            DAT1 = Local1
                            DAT2 = Arg1
                            NUMB = One
                            CMDB = 0x81
                            Local0 = 0x0100
                            While ((Local0 && CMDB))
                            {
                                Sleep (0x02)
                                Local0--
                            }

                            If ((CMDB == Zero))
                            {
                                Local0 = Zero
                            }
                            Else
                            {
                                Local0 = 0xFF
                            }

                            Release (QEVT)
                            Return (Local0)
                        }

                        Release (QEVT)
                        Return (0xFF)
                    }

                    Method (ECCC, 4, Serialized)
                    {
                        Local0 = Acquire (QEVT, 0x07D0)
                        If ((Local0 == Zero))
                        {
                            DAT0 = Arg1
                            DAT1 = Arg2
                            DAT2 = Arg3
                            CMDB = Arg0
                            Local0 = 0x0100
                            While ((Local0 && CMDB))
                            {
                                Sleep (0x02)
                                Local0--
                            }

                            If ((CMDB == Zero))
                            {
                                Local0 = Zero
                            }
                            Else
                            {
                                Local0 = 0xFF
                            }

                            Release (QEVT)
                            Return (Local0)
                        }

                        Release (QEVT)
                        Return (0xFF)
                    }

                    Mutex (Z009, 0x00)
                    Mutex (QEVT, 0x00)
                    OperationRegion (ERAM, SystemMemory, 0xFE800700, 0xFF)
                    Field (ERAM, ByteAcc, Lock, Preserve)
                    {
                        ECMV,   8, 
                        ECSV,   8, 
                        ECTV,   8, 
                        ECRV,   8, 
                        Offset (0x05), 
                        PNMD,   8, 
                        CPTP,   1, 
                        GPTP,   1, 
                        Offset (0x07), 
                        BF2S,   1, 
                        BF12,   1, 
                        BF8S,   1, 
                        BF10,   1, 
                        Offset (0x08), 
                        FNLK,   1, 
                        FNST,   1, 
                        FKS1,   1, 
                        FNRE,   5, 
                        Offset (0x10), 
                        LSTE,   1, 
                        LID2,   1, 
                        BKTS,   1, 
                        LDRV,   5, 
                        Offset (0x20), 
                        TP00,   8, 
                        TP01,   8, 
                        TP02,   8, 
                        TP03,   8, 
                        TP04,   8, 
                        TP05,   8, 
                        TP06,   8, 
                        TP07,   8, 
                        TP08,   8, 
                        TP09,   8, 
                        BTST,   3, 
                        BSRV,   5, 
                        TP0B,   8, 
                        TP0C,   8, 
                        Offset (0x2E), 
                        CPOF,   1, 
                        GPOF,   1, 
                        SCOF,   1, 
                        AMOF,   1, 
                        TCOF,   1, 
                        CGOF,   1, 
                        DROF,   1, 
                        BAOF,   1, 
                        CPUF,   1, 
                        GPUF,   1, 
                        SCUF,   1, 
                        AMUF,   1, 
                        TCUF,   1, 
                        CGUF,   1, 
                        DRUF,   1, 
                        BAUF,   1, 
                        SMPR,   8, 
                        SMST,   8, 
                        SMAD,   8, 
                        SMCM,   8, 
                        SDA0,   8, 
                        SDA1,   248, 
                        SMBC,   8, 
                        Offset (0x58), 
                        B1EL,   8, 
                        B1EH,   8, 
                        B1CH,   48, 
                        BTOI,   64, 
                        HWTS,   32, 
                        Offset (0x70), 
                        PDBV,   8, 
                        DEFF,   1, 
                        PBFS,   1, 
                        FNKS,   1, 
                        MICD,   1, 
                        Offset (0x74), 
                        PBPH,   8, 
                        PBPL,   8, 
                        Offset (0x80), 
                        ACST,   1, 
                        BST1,   1, 
                        BST2,   1, 
                        PRED,   5, 
                        BTBM,   8, 
                        BTSN,   16, 
                        BTDC,   16, 
                        BTDV,   16, 
                        BTFC,   16, 
                        BTTP,   16, 
                        BATE,   1, 
                        BAIO,   1, 
                        BACP,   1, 
                        BAFC,   1, 
                        BAID,   1, 
                        BAFD,   1, 
                        BAAB,   1, 
                        BARV,   1, 
                        SBAD,   1, 
                        SBAU,   1, 
                        SBAP,   1, 
                        SBNC,   1, 
                        BDIS,   1, 
                        BIWP,   1, 
                        BIPC,   1, 
                        BINC,   1, 
                        BAPR,   16, 
                        BAPV,   16, 
                        BARC,   16, 
                        BFCC,   16, 
                        BACC,   16, 
                        BACV,   16, 
                        BTEM,   16, 
                        BAL1,   1, 
                        BAL2,   1, 
                        BAL3,   1, 
                        BAL4,   1, 
                        BAL5,   1, 
                        BAL6,   1, 
                        BAL7,   1, 
                        BAL8,   1, 
                        BRM1,   1, 
                        BRM2,   1, 
                        BRM3,   1, 
                        BRM4,   1, 
                        BRM5,   1, 
                        BRM6,   1, 
                        BRM7,   1, 
                        BRM8,   1, 
                        BRSO,   8, 
                        BASO,   8, 
                        Offset (0xA2), 
                        UMAF,   1, 
                        Offset (0xA9), 
                        MISC,   1, 
                        RSTF,   1, 
                        UBC1,   1, 
                        UBC2,   1, 
                        BRSV,   4, 
                        Offset (0xB4), 
                        BTMN,   16, 
                        BTNM,   144, 
                        BTCC,   16, 
                        BSSS,   8, 
                        BSSC,   8, 
                        BTDL,   8, 
                        BTDH,   8, 
                        POWT,   8, 
                        Offset (0xD0), 
                        ASTA,   16, 
                        EUPV,   16, 
                        ELOV,   16, 
                        ICDA,   16, 
                        CADA,   16, 
                        KECD,   16, 
                        Offset (0xE0), 
                        ACCH,   8, 
                        ACCL,   8, 
                        DCCH,   8, 
                        DCCL,   8, 
                        STCP,   8, 
                        SPCP,   8, 
                        Offset (0xF0), 
                        SHDC,   8, 
                        WUPC,   8, 
                        Offset (0xFC), 
                        WDTL,   8, 
                        WDTH,   8, 
                        HWF0,   1, 
                        HWF1,   1, 
                        HWF2,   1, 
                        HWF3,   1, 
                        HWF4,   1, 
                        HWF5,   1
                    }

                    OperationRegion (SMA2, SystemMemory, 0xFE800800, 0x80)
                    Field (SMA2, ByteAcc, Lock, Preserve)
                    {
                        CMDB,   8, 
                        STAT,   8, 
                        NUMB,   8, 
                        DAT0,   8, 
                        DAT1,   8, 
                        DAT2,   8
                    }

                    Method (_Q1A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC1A
                        LIDS = One
                        Notify (LID, 0x80) // Status Change
                    }

                    Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC19
                        LIDS = Zero
                        Notify (LID, 0x80) // Status Change
                    }

                    Method (_Q30, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC30
                        Notify (PWRB, 0x80) // Status Change
                    }

                    Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC32
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            If ((ACST & One))
                            {
                                PWRS = One
                            }
                            Else
                            {
                                PWRS = Zero
                            }

                            Notify (ACAD, 0x80) // Status Change
                            Notify (BAT0, 0x80) // Status Change
                            Release (Z009)
                        }
                    }

                    Method (_Q33, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC33
                        Sleep (0x01F4)
                        Notify (BAT0, 0x81) // Information Change
                        Sleep (0x01F4)
                        Notify (BAT0, 0x80) // Status Change
                    }

                    Method (_Q35, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC35
                    }

                    Method (_Q36, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC36
                    }

                    Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC37
                    }

                    Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEC14
                        Local1 = (FNST << One)
                        Local2 = (FKS1 << 0x02)
                        Local3 = (FNRE << 0x03)
                        Local4 = (Local3 + (Local2 + (FNLK + Local1)))
                        ACMX = 0x57
                        ACMA = Local4
                    }

                    Name (WMEN, Zero)
                    Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x0A
                        Notify (^^^GP17.VGA.LCD, 0x87) // Device-Specific
                        WMEN = 0x0281
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x0B
                        Notify (^^^GP17.VGA.LCD, 0x86) // Device-Specific
                        WMEN = 0x0282
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x10
                        WMEN = 0x0287
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x12
                        WMEN = 0x0289
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x13
                        WMEN = 0x028A
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_QF2, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF2
                        WMEN = 0x0293
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_QF3, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF3
                        WMEN = 0x0294
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_Q21, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x21
                        WMEN = 0x0296
                        Notify (WMI0, 0xA0) // Device-Specific
                    }

                    Method (_QE0, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE0
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            CPOF = Zero
                            WMEN = 0x0100
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE1, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE1
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            CPUF = Zero
                            WMEN = 0x0100
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE2, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE2
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            GPOF = Zero
                            WMEN = 0x0101
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE3, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE3
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            GPUF = Zero
                            WMEN = 0x0101
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QEA, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEA
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            SCOF = Zero
                            WMEN = 0x0105
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QEB, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEB
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            SCUF = Zero
                            WMEN = 0x0105
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF0, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF0
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262C)
                            WTER (0x262C, Local0 &= 0xF7)
                            WMEN = 0x0106
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF1, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF1
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262D)
                            WTER (0x262D, Local0 &= 0xF7)
                            WMEN = 0x0106
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE4, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE4
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            TCOF = Zero
                            WMEN = 0x0107
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE5, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE5
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            TCUF = Zero
                            WMEN = 0x0107
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE6, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE6
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            CGOF = Zero
                            WMEN = 0x0108
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE7, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE7
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            CGUF = Zero
                            WMEN = 0x0108
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QEE, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEE
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            DROF = Zero
                            WMEN = 0x010B
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QEF, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xEF
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            DRUF = Zero
                            WMEN = 0x010B
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE8, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE8
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            BAOF = Zero
                            WMEN = 0x010E
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QE9, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xE9
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            BAUF = Zero
                            WMEN = 0x010E
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF8, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF8
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            AMOF = Zero
                            WMEN = 0x010F
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF9, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF9
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            AMUF = Zero
                            WMEN = 0x010F
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF4, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF4
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262C)
                            WTER (0x262C, Local0 &= 0xFD)
                            WMEN = 0x0129
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF5, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF5
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262D)
                            WTER (0x262D, Local0 &= 0xFD)
                            WMEN = 0x0129
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF6, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF6
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262C)
                            WTER (0x262C, Local0 &= 0xFB)
                            WMEN = 0x012A
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (_QF7, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xF7
                        If ((Acquire (Z009, 0x2000) == Zero))
                        {
                            Local0 = Zero
                            Local0 = RDER (0x262D)
                            WTER (0x262D, Local0 &= 0xFB)
                            WMEN = 0x012A
                            Notify (WMI0, 0xA0) // Device-Specific
                            Release (Z009)
                        }
                    }

                    Method (SAPL, 3, Serialized)
                    {
                        If ((DPTC == One))
                        {
                            Name (DSPL, Buffer (0x11) {})
                            CreateWordField (DSPL, Zero, SSZE)
                            CreateByteField (DSPL, 0x02, PMDO)
                            CreateDWordField (DSPL, 0x03, STPL)
                            CreateByteField (DSPL, 0x07, PMDT)
                            CreateDWordField (DSPL, 0x08, SPPT)
                            CreateByteField (DSPL, 0x0C, PMDH)
                            CreateDWordField (DSPL, 0x0D, FPPT)
                            SSZE = 0x11
                            PMDO = 0x05
                            STPL = Arg0
                            PMDT = 0x07
                            SPPT = Arg1
                            PMDH = 0x06
                            FPPT = Arg2
                            ALIB (0x0C, DSPL)
                        }
                    }

                    Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x41
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x1388, 0x1388, 0x1388)
                                }
                                Else
                                {
                                    SAPL (0x6D60, 0x6D60, 0x6D60)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x1388, 0x1388, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q42, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x42
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x2710, 0x2710, 0x2710)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0x88B8, 0x88B8)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x2710, 0x2710, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q43, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x43
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x44
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q45, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x45
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x7530, 0x7530, 0x7530)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BTEM < 0x0B0F))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q61, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x61
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x1388, 0x1388, 0x1388)
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x2710, 0x2710, 0x2710)
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                }
                                Else
                                {
                                    SAPL (0x7530, 0x7530, 0x7530)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x1388, 0x1388, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x2710, 0x2710, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q62, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x62
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x6D60, 0x6D60, 0x6D60)
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x88B8, 0x88B8, 0x88B8)
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q63, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x63
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x6D60, 0x6D60, 0x6D60)
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x88B8, 0x88B8, 0x88B8)
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                Else
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If ((BRSO <= 0x14))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x28))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x3C))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((BRSO <= 0x50))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_Q54, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x54
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x61A8, 0x61A8, 0x61A8)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x88B8, 0x88B8, 0x88B8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q51, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x51
                        If ((DPTC == One))
                        {
                            SAPL (0x88B8, 0xD2F0, 0xFDE8)
                            Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                        }
                    }

                    Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x52
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x9C40, 0xA410, 0xEA60)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0xD2F0, 0xD2F0, 0xFDE8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x53
                        If ((DPTC == One))
                        {
                            SAPL (0x88B8, 0xD2F0, 0xFDE8)
                            Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                        }
                    }

                    Method (_Q55, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x55
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x88B8, 0xA410, 0xEA60)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0xAFC8, 0xD2F0, 0xFDE8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q56, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x55
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x61A8, 0x61A8, 0x61A8)
                            }
                        }
                    }

                    Method (_QD1, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xD1
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x7530, 0xA410, 0xEA60)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x7530, 0xD2F0, 0xFDE8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_QD2, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xD2
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x61A8, 0xA410, 0xEA60)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x61A8, 0xD2F0, 0xFDE8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_QD3, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xD3
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x4E20, 0xA410, 0xEA60)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x4E20, 0xD2F0, 0xFDE8)
                                Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                            }
                        }
                    }

                    Method (_QD4, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xD4
                        If ((DPTC == One))
                        {
                            If (PNMD)
                            {
                                If ((UMAF == One))
                                {
                                    SAPL (0x9C40, 0xA410, 0xEA60)
                                }

                                If ((UMAF == Zero))
                                {
                                    If ((TP06 > 0x43))
                                    {
                                        SAPL (0x88B8, 0xD2F0, 0xFDE8)
                                    }

                                    If ((TP06 < 0x39))
                                    {
                                        SAPL (0xD2F0, 0xD2F0, 0xFDE8)
                                    }

                                    Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                                }
                            }
                            Else
                            {
                                If ((UMAF == One))
                                {
                                    SAPL (0x88B8, 0xA410, 0xEA60)
                                }

                                If ((UMAF == Zero))
                                {
                                    If ((TP06 > 0x43))
                                    {
                                        SAPL (0x88B8, 0xD2F0, 0xFDE8)
                                    }

                                    If ((TP06 < 0x39))
                                    {
                                        SAPL (0xAFC8, 0xD2F0, 0xFDE8)
                                    }

                                    Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Method (_QC8, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0xC8
                        If (PNMD)
                        {
                            WMEN = 0x02A1
                            Notify (WMI0, 0xA0) // Device-Specific
                        }
                        Else
                        {
                            WMEN = 0x02A0
                            Notify (WMI0, 0xA0) // Device-Specific
                        }

                        If ((UMAF == Zero))
                        {
                            Notify (^^^GPP0.PEGP, 0xC0) // Hardware-Specific
                        }
                    }

                    Method (_Q65, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x65
                        If ((DPTC == One))
                        {
                            If ((UMAF == Zero))
                            {
                                Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x66
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x4E20, 0x4E20, 0x4E20)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x2EE0, 0x2EE0, 0x2EE0)
                                Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x67
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x2710, 0x2710, 0x2710)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x1388, 0x1388, 0x1388)
                                Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                            }
                        }
                    }

                    Method (_Q68, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x68
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x4E20, 0x4E20, 0x4E20)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x4E20, 0x4E20, 0x4E20)
                            }
                        }
                    }

                    Method (_Q69, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x69
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                SAPL (0x2710, 0x2710, 0x2710)
                            }

                            If ((UMAF == Zero))
                            {
                                SAPL (0x2710, 0x2710, 0x2710)
                            }
                        }
                    }

                    Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
                    {
                        P80H = 0x64
                        If ((DPTC == One))
                        {
                            If ((UMAF == One))
                            {
                                If (((BRSO <= 0x14) && ((BTEM >= 0x0B0F) && 
                                    (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x6D60, 0x6D60, 0x6D60)
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x88B8, 0x88B8, 0x88B8)
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x7D00, 0x7D00, 0x7D00)
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x7D00, 0x7D00, 0x7D00)
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x59D8, 0x59D8, 0x59D8)
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x4650, 0x4650, 0x4650)
                                }
                                ElseIf ((((BRSO >= Zero) && (BRSO <= 0x14)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x36B0, 0x36B0, 0x36B0)
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x88B8, 0xAFC8, 0xC350)
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x88B8, 0x88B8, 0x88B8)
                                }
                                Else
                                {
                                    SAPL (0x6D60, 0x6D60, 0x6D60)
                                }
                            }

                            If ((UMAF == Zero))
                            {
                                If (((BRSO <= 0x14) && ((BTEM >= 0x0B0F) && 
                                    (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    ((BTEM >= 0x0B0F) && (BTEM <= 0x0C9F))))
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x3A98, 0x3A98, 0x3A98)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x2710, 0x2710, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= Zero) && (BRSO <= 0x14)) && 
                                    (BTEM < 0x0B0F)))
                                {
                                    SAPL (0x1388, 0x1388, 0x2710)
                                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x51) && (BRSO <= 0x64)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x61A8, 0x61A8, 0x61A8)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x3D) && (BRSO <= 0x50)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x29) && (BRSO <= 0x3C)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                                }
                                ElseIf ((((BRSO >= 0x15) && (BRSO <= 0x28)) && 
                                    (BTEM > 0x0C9F)))
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                                }
                                Else
                                {
                                    SAPL (0x4E20, 0x4E20, 0x4E20)
                                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                                }
                            }
                        }
                    }

                    Device (HWWD)
                    {
                        Name (_HID, EisaId ("WDT0001"))  // _HID: Hardware ID
                        Name (_UID, Zero)  // _UID: Unique ID
                        Name (TIME, Zero)
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Method (OWDT, 0, Serialized)
                        {
                            HWF1 = One
                            HWF0 = One
                            Return (0xFF01)
                        }

                        Method (CWDT, 0, Serialized)
                        {
                            HWF0 = Zero
                            Return (0xFF02)
                        }

                        Method (SWDT, 1, Serialized)
                        {
                            TIME = Arg0
                            WDTL = (Arg0 & 0xFF)
                            WDTH = ((Arg0 & 0xFF00) >> 0x08)
                            Return (Arg0)
                        }

                        Method (FWDT, 1, Serialized)
                        {
                            If ((TIME == One))
                            {
                                Return (0xFF04)
                            }

                            WDTL = (TIME & 0xFF)
                            WDTH = ((TIME & 0xFF00) >> 0x08)
                            Return (0xFF04)
                        }

                        Method (SSMI, 0, Serialized)
                        {
                            Return (0xFF05)
                        }
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

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
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
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = One
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (!Acquire (^^PCI0.LPC0.EC0.Z009, 0x012C))
                    {
                        Local0 = ^^PCI0.LPC0.EC0.ACST /* \_SB_.PCI0.LPC0.EC0_.ACST */
                        If ((Local0 != ACDC))
                        {
                            CreateWordField (XX00, Zero, SSZE)
                            CreateByteField (XX00, 0x02, ACSS)
                            SSZE = 0x03
                            If (Local0)
                            {
                                P80H = 0xECAC
                                AFN4 (One)
                                ACSS = Zero
                            }
                            Else
                            {
                                P80H = 0xECDC
                                AFN4 (0x02)
                                ACSS = One
                            }

                            ALIB (One, XX00)
                            ACDC = Local0
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

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (!Acquire (^^PCI0.LPC0.EC0.Z009, 0x012C))
                    {
                        Local0 = ^^PCI0.LPC0.EC0.BST1 /* \_SB_.PCI0.LPC0.EC0_.BST1 */
                        Release (^^PCI0.LPC0.EC0.Z009)
                        If ((Local0 & One))
                        {
                            Return (0x1F)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Return (0x0F)
            }

            Name (BPKG, Package (0x15)
            {
                One, 
                Zero, 
                Ones, 
                Ones, 
                One, 
                Ones, 
                Zero, 
                Zero, 
                Ones, 
                Ones, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Ones, 
                Ones, 
                "AP16L5J", 
                "+000,000,000,000", 
                "LION", 
                "Huawei", 
                Zero
            })
            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If ((Acquire (^^PCI0.LPC0.EC0.Z009, 0x2000) == Zero))
                    {
                        If (((^^PCI0.LPC0.EC0.BTDV && ^^PCI0.LPC0.EC0.BTFC) && ^^PCI0.LPC0.EC0.BTDC))
                        {
                            BPKG [One] = One
                            Local0 = ^^PCI0.LPC0.EC0.BTDC /* \_SB_.PCI0.LPC0.EC0_.BTDC */
                            BPKG [0x02] = Local0
                            Local0 = ^^PCI0.LPC0.EC0.BTFC /* \_SB_.PCI0.LPC0.EC0_.BTFC */
                            BPKG [0x03] = Local0
                            BPKG [0x05] = ^^PCI0.LPC0.EC0.BTDV /* \_SB_.PCI0.LPC0.EC0_.BTDV */
                            Local0 = ^^PCI0.LPC0.EC0.BTFC /* \_SB_.PCI0.LPC0.EC0_.BTFC */
                            If ((^^PCI0.LPC0.EC0.UMAF == One))
                            {
                                Local0 *= 0x06
                            }
                            Else
                            {
                                Local0 *= 0x0A
                            }

                            Divide (Local0, 0x64, Local1, Local2)
                            BPKG [0x06] = Local2
                            Local0 = ^^PCI0.LPC0.EC0.BTFC /* \_SB_.PCI0.LPC0.EC0_.BTFC */
                            Local0 *= 0x02
                            Divide (Local0, 0x64, Local1, Local2)
                            BPKG [0x07] = Local2
                            BPKG [0x08] = ^^PCI0.LPC0.EC0.BTCC /* \_SB_.PCI0.LPC0.EC0_.BTCC */
                            BPKG [0x09] = 0x251C
                        }

                        BPKG [0x10] = ToString (^^PCI0.LPC0.EC0.BTNM, Ones)
                        ToDecimalString (^^PCI0.LPC0.EC0.BTSN, Local0)
                        BPKG [0x11] = ToBuffer (Local0)
                        Name (BMNT, Buffer (0x0A)
                        {
                             0x00                                             // .
                        })
                        BMNT = ^^PCI0.LPC0.EC0.BTOI /* \_SB_.PCI0.LPC0.EC0_.BTOI */
                        BPKG [0x13] = ToString (BMNT, Ones)
                        Release (^^PCI0.LPC0.EC0.Z009)
                    }
                }

                Return (BPKG) /* \_SB_.BAT0.BPKG */
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If (!Acquire (^^PCI0.LPC0.EC0.Z009, 0x012C))
                    {
                        If (Arg0)
                        {
                            Local1 = Arg0
                            Divide (Local1, 0x0A, Local0, Local1)
                            ^^PCI0.LPC0.EC0.BTTP = Local1
                            Release (^^PCI0.LPC0.EC0.Z009)
                        }
                    }
                }
            }

            Name (PKG1, Package (0x04)
            {
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            Method (_BST, 0, Serialized)  // _BST: Battery Status
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If ((Acquire (^^PCI0.LPC0.EC0.Z009, 0xA000) == Zero))
                    {
                        Switch (^^PCI0.LPC0.EC0.BTST)
                        {
                            Case (Zero)
                            {
                                PKG1 [Zero] = Zero
                            }
                            Case (One)
                            {
                                PKG1 [Zero] = One
                            }
                            Case (0x02)
                            {
                                PKG1 [Zero] = 0x02
                            }
                            Case (0x04)
                            {
                                PKG1 [Zero] = 0x04
                            }

                        }

                        PKG1 [One] = ^^PCI0.LPC0.EC0.BAPR /* \_SB_.PCI0.LPC0.EC0_.BAPR */
                        PKG1 [0x02] = ^^PCI0.LPC0.EC0.BARC /* \_SB_.PCI0.LPC0.EC0_.BARC */
                        PKG1 [0x03] = ^^PCI0.LPC0.EC0.BAPV /* \_SB_.PCI0.LPC0.EC0_.BAPV */
                        Release (^^PCI0.LPC0.EC0.Z009)
                        Return (PKG1) /* \_SB_.BAT0.PKG1 */
                    }
                }

                Return (PKG1) /* \_SB_.BAT0.PKG1 */
            }
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                If (^^PCI0.LPC0.ECOK ())
                {
                    If ((^^PCI0.LPC0.EC0.ECRD (RefOf (^^PCI0.LPC0.EC0.LSTE)) == Zero))
                    {
                        Return (One)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }

                Return (One)
            }
        }
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
            FRTB,   32
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   5, 
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
            HFPE,   1, 
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
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
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

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
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

        Name (SVBF, Buffer (0x0100)
        {
             0x00                                             // .
        })
        CreateDWordField (SVBF, Zero, S0A4)
        CreateDWordField (SVBF, 0x04, S0A8)
        CreateDWordField (SVBF, 0x08, S0B0)
        CreateDWordField (SVBF, 0x0C, S0D0)
        CreateDWordField (SVBF, 0x10, S116)
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

        Method (FRUI, 2, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Arg1 = IUA0 /* \_SB_.IUA0 */
            }

            If ((Arg0 == One))
            {
                Arg1 = IUA1 /* \_SB_.IUA1 */
            }

            If ((Arg0 == 0x02))
            {
                Arg1 = IUA2 /* \_SB_.IUA2 */
            }

            If ((Arg0 == 0x03))
            {
                Arg1 = IUA3 /* \_SB_.IUA3 */
            }
        }

        Method (SRAD, 2, Serialized)
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

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
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

            If ((Arg0 != ADTD))
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
            Local3 = (One << Arg0)
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
                    PG1A = One
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
                    PG1A = Zero
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
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

        Device (HFP1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HFPE)
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
                        0xFEC11000,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.HFP1._CRS.RBUF */
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
                    Memory32Fixed (ReadWrite,
                        0xFED81200,         // Address Base
                        0x00000100,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
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
                        If (IER0)
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
        }

        Device (FUR2)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {3}
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
        }

        Device (FUR3)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
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
        }

        Device (I2CA)
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
                SRAD (0x05, 0xC8)
            }
        }

        Device (I2CB)
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
                    {4}
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
        }

        Device (I2CE)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {14}
                Memory32Fixed (ReadWrite,
                    0xFEDC6000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC4E == One))
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
                SRAD (0x09, 0xC8)
            }
        }

        Device (I2CF)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {15}
                Memory32Fixed (ReadWrite,
                    0xFEDCB000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC5E == One))
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
                SRAD (0x0A, 0xC8)
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (IER0)
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
                FRUI (WUR0, IRQL)
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (IER1)
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
                FRUI (WUR1, IRQL)
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (IER2)
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
                FRUI (WUR2, IRQL)
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (IER3)
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
                FRUI (WUR3, IRQL)
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_SB.I2CA)
    {
        Device (TPD0)
        {
            Name (_HID, "MSFT0001")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0009
                        }
                })
                Return (RBUF) /* \_SB_.I2CA.TPD0._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (THPD == One)))
                {
                    Return (0x0F)
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

    Scope (_SB.I2CA)
    {
        Device (TPGT)
        {
            Name (_HID, "GXTP7863")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x005D, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0009
                        }
                })
                Return (RBUF) /* \_SB_.I2CA.TPGT._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (((TPOS >= 0x60) & (THPD == 0x02)))
                {
                    Return (0x0F)
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

    Scope (_SB.I2CA)
    {
        Device (NFC)
        {
            Name (_HID, "NTAG0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0057, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0056
                        }
                })
                Return (SBUF) /* \_SB_.I2CA.NFC_._CRS.SBUF */
            }
        }
    }
}

