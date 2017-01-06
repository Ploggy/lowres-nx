//
// Copyright 2016 Timo Kloss
//
// This file is part of LowRes Core.
//
// LowRes Core is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// LowRes Core is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with LowRes Core.  If not, see <http://www.gnu.org/licenses/>.
//

#include "character_rom.h"

uint16_t CharacterRom[][8] = {
    { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , },
    { 960 , 960 , 960 , 960 , 960 , 0 , 960 , 0 , },
    { 15600 , 15600 , 3120 , 0 , 0 , 0 , 0 , 0 , },
    { 15600 , 15600 , 65532 , 15600 , 65532 , 15600 , 15600 , 0 , },
    { 768 , 16380 , 62208 , 16368 , 828 , 65520 , 768 , 0 , },
    { 15372 , 15420 , 240 , 960 , 3840 , 15420 , 12348 , 0 , },
    { 4032 , 15600 , 15552 , 16140 , 62448 , 61632 , 16188 , 0 , },
    { 960 , 960 , 3840 , 0 , 0 , 0 , 0 , 0 , },
    { 240 , 960 , 3840 , 3840 , 3840 , 960 , 240 , 0 , },
    { 3840 , 960 , 240 , 240 , 240 , 960 , 3840 , 0 , },
    { 0 , 15600 , 4032 , 65532 , 4032 , 15600 , 0 , 0 , },
    { 0 , 960 , 960 , 16380 , 960 , 960 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 960 , 960 , 3840 , 0 , },
    { 0 , 0 , 0 , 16380 , 0 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 0 , 960 , 960 , 0 , },
    { 12 , 60 , 240 , 960 , 3840 , 15360 , 12288 , 0 , },
    { 4080 , 15420 , 15612 , 16188 , 15420 , 15420 , 4080 , 0 , },
    { 960 , 4032 , 13248 , 960 , 960 , 960 , 16380 , 0 , },
    { 4080 , 15420 , 60 , 240 , 960 , 3840 , 16380 , 0 , },
    { 4080 , 15420 , 60 , 240 , 60 , 15420 , 4080 , 0 , },
    { 15420 , 15420 , 15420 , 16380 , 60 , 60 , 60 , 0 , },
    { 16380 , 15360 , 15360 , 16368 , 60 , 60 , 16368 , 0 , },
    { 1008 , 3840 , 15360 , 16368 , 15420 , 15420 , 4080 , 0 , },
    { 16380 , 60 , 240 , 960 , 3840 , 3840 , 3840 , 0 , },
    { 4080 , 15420 , 15420 , 4080 , 15420 , 15420 , 4080 , 0 , },
    { 4080 , 15420 , 15420 , 4092 , 60 , 15420 , 4080 , 0 , },
    { 0 , 960 , 960 , 0 , 960 , 960 , 0 , 0 , },
    { 0 , 960 , 960 , 0 , 960 , 960 , 3840 , 0 , },
    { 240 , 960 , 3840 , 15360 , 3840 , 960 , 240 , 0 , },
    { 0 , 0 , 16380 , 0 , 16380 , 0 , 0 , 0 , },
    { 3840 , 960 , 240 , 60 , 240 , 960 , 3840 , 0 , },
    { 4080 , 15420 , 60 , 240 , 960 , 0 , 960 , 0 , },
    { 16368 , 61500 , 61692 , 62268 , 61692 , 61440 , 16368 , 0 , },
    { 4032 , 15600 , 61500 , 61500 , 65532 , 61500 , 61500 , 0 , },
    { 65520 , 61500 , 61500 , 65520 , 61500 , 61500 , 65520 , 0 , },
    { 16368 , 61500 , 61440 , 61440 , 61440 , 61500 , 16368 , 0 , },
    { 65472 , 61680 , 61500 , 61500 , 61500 , 61680 , 65472 , 0 , },
    { 65532 , 61440 , 61440 , 65472 , 61440 , 61440 , 65532 , 0 , },
    { 65532 , 61440 , 61440 , 65472 , 61440 , 61440 , 61440 , 0 , },
    { 16368 , 61500 , 61440 , 61692 , 61500 , 61500 , 16368 , 0 , },
    { 61500 , 61500 , 61500 , 65532 , 61500 , 61500 , 61500 , 0 , },
    { 16380 , 960 , 960 , 960 , 960 , 960 , 16380 , 0 , },
    { 4092 , 60 , 60 , 60 , 60 , 61500 , 16368 , 0 , },
    { 61500 , 61680 , 62400 , 65280 , 62400 , 61680 , 61500 , 0 , },
    { 61440 , 61440 , 61440 , 61440 , 61440 , 61440 , 65532 , 0 , },
    { 61500 , 64764 , 65532 , 62268 , 61500 , 61500 , 61500 , 0 , },
    { 61500 , 64572 , 65340 , 62460 , 61692 , 61500 , 61500 , 0 , },
    { 16368 , 61500 , 61500 , 61500 , 61500 , 61500 , 16368 , 0 , },
    { 65520 , 61500 , 61500 , 65520 , 61440 , 61440 , 61440 , 0 , },
    { 16368 , 61500 , 61500 , 61500 , 62412 , 61680 , 16380 , 0 , },
    { 65520 , 61500 , 61500 , 65520 , 62400 , 61680 , 61500 , 0 , },
    { 16380 , 61440 , 61440 , 16368 , 60 , 60 , 65520 , 0 , },
    { 16380 , 960 , 960 , 960 , 960 , 960 , 960 , 0 , },
    { 61500 , 61500 , 61500 , 61500 , 61500 , 61500 , 16368 , 0 , },
    { 61500 , 61500 , 61500 , 61500 , 15600 , 4032 , 768 , 0 , },
    { 61500 , 61500 , 61500 , 62268 , 65532 , 64764 , 61500 , 0 , },
    { 61500 , 61500 , 15600 , 4032 , 15600 , 61500 , 61500 , 0 , },
    { 15420 , 15420 , 15420 , 4080 , 960 , 960 , 960 , 0 , },
    { 65532 , 240 , 960 , 3840 , 15360 , 61440 , 65532 , 0 , },
    { 4080 , 3840 , 3840 , 3840 , 3840 , 3840 , 4080 , 0 , },
    { 12288 , 15360 , 3840 , 960 , 240 , 60 , 12 , 0 , },
    { 4080 , 240 , 240 , 240 , 240 , 240 , 4080 , 0 , },
    { 960 , 4080 , 15420 , 0 , 0 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 0 , 0 , 16380 , 0 , },
    { 21845 , 21845 , 21845 , 21845 , 21845 , 21845 , 21845 , 21845 , },
    { 22485 , 22485 , 22485 , 22485 , 22485 , 21845 , 22485 , 21845 , },
    { 32245 , 32245 , 23925 , 21845 , 21845 , 21845 , 21845 , 21845 , },
    { 32245 , 32245 , 65533 , 32245 , 65533 , 32245 , 32245 , 21845 , },
    { 22357 , 32765 , 63317 , 32757 , 22397 , 65525 , 22357 , 21845 , },
    { 32093 , 32125 , 22005 , 22485 , 24405 , 32125 , 30077 , 21845 , },
    { 24533 , 32245 , 32213 , 32605 , 63477 , 62933 , 32637 , 21845 , },
    { 22485 , 22485 , 24405 , 21845 , 21845 , 21845 , 21845 , 21845 , },
    { 22005 , 22485 , 24405 , 24405 , 24405 , 22485 , 22005 , 21845 , },
    { 24405 , 22485 , 22005 , 22005 , 22005 , 22485 , 24405 , 21845 , },
    { 21845 , 32245 , 24533 , 65533 , 24533 , 32245 , 21845 , 21845 , },
    { 21845 , 22485 , 22485 , 32765 , 22485 , 22485 , 21845 , 21845 , },
    { 21845 , 21845 , 21845 , 21845 , 22485 , 22485 , 24405 , 21845 , },
    { 21845 , 21845 , 21845 , 32765 , 21845 , 21845 , 21845 , 21845 , },
    { 21845 , 21845 , 21845 , 21845 , 21845 , 22485 , 22485 , 21845 , },
    { 21853 , 21885 , 22005 , 22485 , 24405 , 32085 , 30037 , 21845 , },
    { 24565 , 32125 , 32253 , 32637 , 32125 , 32125 , 24565 , 21845 , },
    { 22485 , 24533 , 30677 , 22485 , 22485 , 22485 , 32765 , 21845 , },
    { 24565 , 32125 , 21885 , 22005 , 22485 , 24405 , 32765 , 21845 , },
    { 24565 , 32125 , 21885 , 22005 , 21885 , 32125 , 24565 , 21845 , },
    { 32125 , 32125 , 32125 , 32765 , 21885 , 21885 , 21885 , 21845 , },
    { 32765 , 32085 , 32085 , 32757 , 21885 , 21885 , 32757 , 21845 , },
    { 22517 , 24405 , 32085 , 32757 , 32125 , 32125 , 24565 , 21845 , },
    { 32765 , 21885 , 22005 , 22485 , 24405 , 24405 , 24405 , 21845 , },
    { 24565 , 32125 , 32125 , 24565 , 32125 , 32125 , 24565 , 21845 , },
    { 24565 , 32125 , 32125 , 24573 , 21885 , 32125 , 24565 , 21845 , },
    { 21845 , 22485 , 22485 , 21845 , 22485 , 22485 , 21845 , 21845 , },
    { 21845 , 22485 , 22485 , 21845 , 22485 , 22485 , 24405 , 21845 , },
    { 22005 , 22485 , 24405 , 32085 , 24405 , 22485 , 22005 , 21845 , },
    { 21845 , 21845 , 32765 , 21845 , 32765 , 21845 , 21845 , 21845 , },
    { 24405 , 22485 , 22005 , 21885 , 22005 , 22485 , 24405 , 21845 , },
    { 24565 , 32125 , 21885 , 22005 , 22485 , 21845 , 22485 , 21845 , },
    { 32757 , 62845 , 62973 , 63357 , 62973 , 62805 , 32757 , 21845 , },
    { 24533 , 32245 , 62845 , 62845 , 65533 , 62845 , 62845 , 21845 , },
    { 65525 , 62845 , 62845 , 65525 , 62845 , 62845 , 65525 , 21845 , },
    { 32757 , 62845 , 62805 , 62805 , 62805 , 62845 , 32757 , 21845 , },
    { 65493 , 62965 , 62845 , 62845 , 62845 , 62965 , 65493 , 21845 , },
    { 65533 , 62805 , 62805 , 65493 , 62805 , 62805 , 65533 , 21845 , },
    { 65533 , 62805 , 62805 , 65493 , 62805 , 62805 , 62805 , 21845 , },
    { 32757 , 62845 , 62805 , 62973 , 62845 , 62845 , 32757 , 21845 , },
    { 62845 , 62845 , 62845 , 65533 , 62845 , 62845 , 62845 , 21845 , },
    { 32765 , 22485 , 22485 , 22485 , 22485 , 22485 , 32765 , 21845 , },
    { 24573 , 21885 , 21885 , 21885 , 21885 , 62845 , 32757 , 21845 , },
    { 62845 , 62965 , 63445 , 65365 , 63445 , 62965 , 62845 , 21845 , },
    { 62805 , 62805 , 62805 , 62805 , 62805 , 62805 , 65533 , 21845 , },
    { 62845 , 65021 , 65533 , 63357 , 62845 , 62845 , 62845 , 21845 , },
    { 62845 , 64893 , 65405 , 63485 , 62973 , 62845 , 62845 , 21845 , },
    { 32757 , 62845 , 62845 , 62845 , 62845 , 62845 , 32757 , 21845 , },
    { 65525 , 62845 , 62845 , 65525 , 62805 , 62805 , 62805 , 21845 , },
    { 32757 , 62845 , 62845 , 62845 , 63453 , 62965 , 32765 , 21845 , },
    { 65525 , 62845 , 62845 , 65525 , 63445 , 62965 , 62845 , 21845 , },
    { 32765 , 62805 , 62805 , 32757 , 21885 , 21885 , 65525 , 21845 , },
    { 32765 , 22485 , 22485 , 22485 , 22485 , 22485 , 22485 , 21845 , },
    { 62845 , 62845 , 62845 , 62845 , 62845 , 62845 , 32757 , 21845 , },
    { 62845 , 62845 , 62845 , 62845 , 32245 , 24533 , 22357 , 21845 , },
    { 62845 , 62845 , 62845 , 63357 , 65533 , 65021 , 62845 , 21845 , },
    { 62845 , 62845 , 32245 , 24533 , 32245 , 62845 , 62845 , 21845 , },
    { 32125 , 32125 , 32125 , 24565 , 22485 , 22485 , 22485 , 21845 , },
    { 65533 , 22005 , 22485 , 24405 , 32085 , 62805 , 65533 , 21845 , },
    { 24565 , 24405 , 24405 , 24405 , 24405 , 24405 , 24565 , 21845 , },
    { 30037 , 32085 , 24405 , 22485 , 22005 , 21885 , 21853 , 21845 , },
    { 24565 , 22005 , 22005 , 22005 , 22005 , 22005 , 24565 , 21845 , },
    { 22485 , 24565 , 32125 , 21845 , 21845 , 21845 , 21845 , 21845 , },
    { 21845 , 21845 , 21845 , 21845 , 21845 , 21845 , 32765 , 21845 , },
    { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , },
    { 320 , 2000 , 2000 , 2000 , 2000 , 320 , 2000 , 320 , },
    { 5200 , 32244 , 32244 , 7540 , 1040 , 0 , 0 , 0 , },
    { 1040 , 7540 , 32765 , 7540 , 7540 , 32765 , 7540 , 1040 , },
    { 256 , 1876 , 8189 , 32724 , 6141 , 32756 , 5968 , 256 , },
    { 5124 , 32029 , 32116 , 5584 , 1876 , 7549 , 29821 , 4116 , },
    { 336 , 2036 , 8052 , 8148 , 32253 , 32116 , 8157 , 1348 , },
    { 320 , 2000 , 2000 , 8000 , 1280 , 0 , 0 , 0 , },
    { 80 , 500 , 2000 , 8000 , 8000 , 2000 , 500 , 80 , },
    { 1280 , 8000 , 2000 , 500 , 500 , 2000 , 8000 , 1280 , },
    { 1040 , 7540 , 6100 , 32765 , 6100 , 7540 , 1040 , 0 , },
    { 320 , 2000 , 6100 , 32765 , 6100 , 2000 , 320 , 0 , },
    { 0 , 0 , 0 , 320 , 2000 , 2000 , 8000 , 1280 , },
    { 0 , 0 , 5460 , 32765 , 5460 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 320 , 2000 , 2000 , 320 , },
    { 20 , 125 , 500 , 2000 , 8000 , 32000 , 29696 , 4096 , },
    { 1360 , 8180 , 32125 , 32253 , 32637 , 32125 , 8180 , 1360 , },
    { 320 , 2000 , 8144 , 2000 , 2000 , 6100 , 32765 , 5460 , },
    { 1360 , 8180 , 32125 , 5620 , 2000 , 8020 , 32765 , 5460 , },
    { 1360 , 8180 , 32125 , 5620 , 5245 , 32125 , 8180 , 1360 , },
    { 5140 , 32125 , 32125 , 32765 , 5501 , 125 , 125 , 20 , },
    { 5460 , 32765 , 32084 , 32756 , 5501 , 5501 , 32756 , 5456 , },
    { 336 , 2036 , 8016 , 32756 , 32125 , 32125 , 8180 , 1360 , },
    { 5460 , 32765 , 5501 , 500 , 2000 , 8000 , 8000 , 1280 , },
    { 1360 , 8180 , 32125 , 8180 , 32125 , 32125 , 8180 , 1360 , },
    { 1360 , 8180 , 32125 , 8189 , 5501 , 32125 , 8180 , 1360 , },
    { 0 , 0 , 320 , 2000 , 320 , 2000 , 320 , 0 , },
    { 0 , 0 , 320 , 2000 , 320 , 2000 , 8000 , 1280 , },
    { 0 , 80 , 500 , 2000 , 8000 , 2000 , 500 , 80 , },
    { 0 , 0 , 1360 , 8180 , 1360 , 8180 , 1360 , 0 , },
    { 0 , 1280 , 8000 , 2000 , 500 , 2000 , 8000 , 1280 , },
    { 1360 , 8180 , 32125 , 5620 , 2000 , 320 , 2000 , 320 , },
    { 1360 , 8180 , 32125 , 32253 , 32253 , 32084 , 8180 , 1360 , },
    { 320 , 2000 , 8180 , 32125 , 32765 , 32125 , 32125 , 5140 , },
    { 5456 , 32756 , 32125 , 32756 , 32125 , 32125 , 32756 , 5456 , },
    { 1360 , 8180 , 32125 , 32020 , 32020 , 32125 , 8180 , 1360 , },
    { 5440 , 32720 , 32244 , 32125 , 32125 , 32244 , 32720 , 5440 , },
    { 5460 , 32765 , 32084 , 32720 , 32064 , 32084 , 32765 , 5460 , },
    { 5460 , 32765 , 32084 , 32720 , 32064 , 32000 , 32000 , 5120 , },
    { 1360 , 8180 , 32084 , 32253 , 32125 , 32125 , 8180 , 1360 , },
    { 5140 , 32125 , 32125 , 32765 , 32125 , 32125 , 32125 , 5140 , },
    { 5460 , 32765 , 6100 , 2000 , 2000 , 6100 , 32765 , 5460 , },
    { 340 , 2045 , 381 , 125 , 5245 , 32125 , 8180 , 1360 , },
    { 5140 , 32125 , 32244 , 32720 , 32720 , 32244 , 32125 , 5140 , },
    { 5120 , 32000 , 32000 , 32000 , 32000 , 32084 , 32765 , 5460 , },
    { 4100 , 29725 , 32125 , 32765 , 32765 , 32125 , 32125 , 5140 , },
    { 5140 , 32125 , 32637 , 32765 , 32253 , 32125 , 32125 , 5140 , },
    { 1360 , 8180 , 32125 , 32125 , 32125 , 32125 , 8180 , 1360 , },
    { 5456 , 32756 , 32125 , 32756 , 32080 , 32000 , 32000 , 5120 , },
    { 1360 , 8180 , 32125 , 32125 , 32221 , 32244 , 8189 , 1364 , },
    { 5456 , 32756 , 32125 , 32756 , 32720 , 32244 , 32125 , 5140 , },
    { 1364 , 8189 , 32084 , 8180 , 1405 , 5501 , 32756 , 5456 , },
    { 5460 , 32765 , 6100 , 2000 , 2000 , 2000 , 2000 , 320 , },
    { 5140 , 32125 , 32125 , 32125 , 32125 , 32125 , 8180 , 1360 , },
    { 5140 , 32125 , 32125 , 32125 , 32125 , 8180 , 2000 , 320 , },
    { 5140 , 32125 , 32125 , 32765 , 32765 , 32125 , 29725 , 4100 , },
    { 5140 , 32125 , 8180 , 2000 , 8180 , 32125 , 32125 , 5140 , },
    { 5140 , 32125 , 32125 , 8180 , 2000 , 2000 , 2000 , 320 , },
    { 5460 , 32765 , 5620 , 2000 , 8000 , 32084 , 32765 , 5460 , },
    { 1360 , 8180 , 8016 , 8000 , 8000 , 8016 , 8180 , 1360 , },
    { 5120 , 32000 , 8000 , 2000 , 500 , 125 , 29 , 4 , },
    { 1360 , 8180 , 1524 , 500 , 500 , 1524 , 8180 , 1360 , },
    { 320 , 2000 , 8180 , 32125 , 5140 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 0 , 5460 , 32765 , 5460 , },
    { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , },
    { 960 , 976 , 976 , 976 , 976 , 80 , 960 , 80 , },
    { 15600 , 15860 , 3380 , 260 , 0 , 0 , 0 , 0 , },
    { 15600 , 15860 , 65532 , 15861 , 65532 , 15861 , 15860 , 1300 , },
    { 768 , 16380 , 63317 , 16368 , 1916 , 65525 , 5972 , 64 , },
    { 15372 , 15677 , 1525 , 980 , 3920 , 15740 , 13629 , 1029 , },
    { 4032 , 15856 , 15828 , 16156 , 63473 , 62676 , 16188 , 1349 , },
    { 960 , 976 , 3920 , 320 , 0 , 0 , 0 , 0 , },
    { 240 , 980 , 3920 , 3904 , 3904 , 960 , 240 , 20 , },
    { 3840 , 960 , 240 , 244 , 244 , 980 , 3920 , 320 , },
    { 0 , 15600 , 4052 , 65532 , 8149 , 15856 , 1300 , 0 , },
    { 0 , 960 , 976 , 16380 , 2005 , 976 , 80 , 0 , },
    { 0 , 0 , 0 , 0 , 960 , 976 , 3920 , 320 , },
    { 0 , 0 , 0 , 16380 , 1365 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 0 , 960 , 976 , 80 , },
    { 12 , 61 , 245 , 980 , 3920 , 15680 , 13568 , 1024 , },
    { 4080 , 15740 , 15869 , 16189 , 15741 , 15677 , 4085 , 340 , },
    { 960 , 4048 , 13264 , 2000 , 976 , 976 , 16380 , 1365 , },
    { 4080 , 15740 , 1341 , 245 , 980 , 3920 , 16380 , 1365 , },
    { 4080 , 15740 , 1341 , 245 , 60 , 15421 , 4085 , 340 , },
    { 15420 , 15677 , 15677 , 16381 , 1405 , 61 , 61 , 5 , },
    { 16380 , 15701 , 15616 , 16368 , 1404 , 61 , 16373 , 1364 , },
    { 1008 , 3924 , 15680 , 16368 , 15740 , 15677 , 4085 , 340 , },
    { 16380 , 1405 , 245 , 980 , 3920 , 3904 , 3904 , 320 , },
    { 4080 , 15740 , 15677 , 4085 , 15740 , 15677 , 4085 , 340 , },
    { 4080 , 15740 , 15677 , 4093 , 381 , 15421 , 4085 , 340 , },
    { 0 , 960 , 976 , 80 , 960 , 976 , 80 , 0 , },
    { 0 , 960 , 976 , 80 , 960 , 976 , 3920 , 320 , },
    { 240 , 980 , 3920 , 15680 , 3840 , 960 , 240 , 20 , },
    { 0 , 0 , 16380 , 1365 , 16380 , 1365 , 0 , 0 , },
    { 3840 , 960 , 240 , 60 , 245 , 980 , 3920 , 320 , },
    { 4080 , 15740 , 1341 , 245 , 980 , 80 , 960 , 80 , },
    { 16368 , 62844 , 62717 , 63293 , 62717 , 62485 , 16368 , 1364 , },
    { 4032 , 15856 , 62780 , 62525 , 65533 , 62845 , 62525 , 5125 , },
    { 65520 , 62844 , 62525 , 65525 , 62844 , 62525 , 65525 , 5460 , },
    { 16368 , 62844 , 62469 , 62464 , 62464 , 62524 , 16373 , 1364 , },
    { 65472 , 62960 , 62524 , 62525 , 62525 , 62709 , 65492 , 5456 , },
    { 65532 , 62805 , 62464 , 65472 , 62800 , 62464 , 65532 , 5461 , },
    { 65532 , 62805 , 62464 , 65472 , 62800 , 62464 , 62464 , 5120 , },
    { 16368 , 62844 , 62469 , 62716 , 62525 , 62525 , 16373 , 1364 , },
    { 61500 , 62525 , 62525 , 65533 , 62845 , 62525 , 62525 , 5125 , },
    { 16380 , 2005 , 976 , 976 , 976 , 976 , 16380 , 1365 , },
    { 4092 , 381 , 61 , 61 , 61 , 61501 , 16373 , 1364 , },
    { 61500 , 62709 , 63444 , 65360 , 63424 , 62704 , 62524 , 5125 , },
    { 61440 , 62464 , 62464 , 62464 , 62464 , 62464 , 65532 , 5461 , },
    { 61500 , 64765 , 65533 , 63357 , 62589 , 62525 , 62525 , 5125 , },
    { 61500 , 64573 , 65341 , 63485 , 62717 , 62525 , 62525 , 5125 , },
    { 16368 , 62844 , 62525 , 62525 , 62525 , 62525 , 16373 , 1364 , },
    { 65520 , 62844 , 62525 , 65525 , 62804 , 62464 , 62464 , 5120 , },
    { 16368 , 62844 , 62525 , 62525 , 63437 , 62705 , 16380 , 1365 , },
    { 65520 , 62844 , 62525 , 65525 , 63444 , 62704 , 62524 , 5125 , },
    { 16380 , 62805 , 62464 , 16368 , 1404 , 61 , 65525 , 5460 , },
    { 16380 , 2005 , 976 , 976 , 976 , 976 , 976 , 80 , },
    { 61500 , 62525 , 62525 , 62525 , 62525 , 62525 , 16373 , 1364 , },
    { 61500 , 62525 , 62525 , 62525 , 15605 , 4052 , 848 , 64 , },
    { 61500 , 62525 , 62525 , 63293 , 65533 , 65021 , 62781 , 5125 , },
    { 61500 , 62525 , 15605 , 4052 , 15856 , 62780 , 62525 , 5125 , },
    { 15420 , 15677 , 15677 , 4085 , 980 , 976 , 976 , 80 , },
    { 65532 , 5621 , 980 , 3920 , 15680 , 62720 , 65532 , 5461 , },
    { 4080 , 3924 , 3904 , 3904 , 3904 , 3904 , 4080 , 340 , },
    { 12288 , 15360 , 3840 , 960 , 240 , 60 , 13 , 1 , },
    { 4080 , 500 , 244 , 244 , 244 , 244 , 4084 , 340 , },
    { 960 , 4080 , 15740 , 1285 , 0 , 0 , 0 , 0 , },
    { 0 , 0 , 0 , 0 , 0 , 0 , 16380 , 1365 , },
};
