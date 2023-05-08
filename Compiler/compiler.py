# Registers ID's
registersIdentifiers = {
    
    "R0":  "0000",
    "R1":  "0001",
    "R2":  "0010",
    "R3":  "0011",
    "R4":  "0100",
    "R5":  "0101",
    "R6":  "0110",
    "R7":  "0111",
    "R8":  "1000",
    "R9":  "1001",
    "R10": "1010",
    "R11": "1011",
    "R12": "1100",
    "R13": "1101",
    "R14": "1110",
    "R15": "1111"
}

# Operation Code
opCode = {

    # Data-Reg:
    "ADDR": "00000",
    "SUBR": "00001",
    "MULR": "00010",
    "DIVR": "00011",
    "XOR":  "00100",

    # Data-Imm:
    "ADDI": "11000",
    "SUBI": "11001",
    "MULI": "11010",
    "DIVI": "11011",

    # Memory:
    "SOM": "0",
    "LFM": "1",

    # Control:
    "JT": "10",
    "JNT": "11",
}

typeInstruction = {

    # Data-Reg:
    "ADDR": "10",
    "SUBR": "10",
    "MULR": "10",
    "DIVR": "10",
    "XOR":  "10",

    # Data-Imm:
    "ADDI": "10",
    "SUBI": "10",
    "MULI": "10",
    "DIVI": "10",

    # Memory:
    "SOM": "01",
    "LFM": "01",

    # Control:
    "JT": "00",
    "JNT": "00",
}

# Function to read and obtain instruction from a file.txt
def getInstructions(file):

    # Special characters list
    characters = [" ", ",", "]", "["]
    # Variable to store the instructions from the file
    instructionsList = []

    data = open(file, 'r')
    lines = data.readlines()

    # Iterating lines
    for line in lines:

        isMemory = False
        aux = ""
        instruction = []

        # To check if there's a label
        last = line[-2]

        # Is label
        if(last == ":"):

            instructionsList.append([line[:-2]])

        # Is instruction
        else:

            for char in line:

                if(char in characters):
                    
                    if(char == "["):
                        isMemory = True

                    if(aux != ""):
                        instruction.append(aux)
                    
                    aux = ""

                else:

                    aux += char
            
            aux = aux[:-1]
            instruction.append(aux)

            if(isMemory == True):
                instruction.pop()

            instructionsList.append(instruction)

    return instructionsList

def riskManagement(instructionsList, typeInstruction, opCode):
    
    firstCase = controlRiskStall(instructionsList, typeInstruction)
    return firstCase

# Control Risks
def controlRiskStall(instructionsList, typeInstruction):

    instructionsListAux = instructionsList.copy()
    instructionsListAux.append("+")
    
    stall = ['ADDR', 'R0', 'R0', 'R0', "********************"]
    index = 0

    for instruction in instructionsListAux:

        if(len(instruction) > 1):

            # Get name of instruction
            currentInstruction = instruction[0]
            currentInstructionType = typeInstruction[currentInstruction]

            # Is a Control instruction
            if(currentInstructionType == "00"):

                instructionsListAux.insert(index + 1, stall)
                instructionsListAux.insert(index + 2, stall)
                instructionsListAux.insert(index + 3, stall)
                instructionsListAux.insert(index + 4, stall)

        index += 1

    return instructionsListAux

# 0 instructions between them
# Case 1
def insertFirstStall(instructionsList, typeInstruction, opCode):

    instructionsListAux = instructionsList.copy()
    instructionsListAux.append("+")
    
    stall = ['ADDR', 'R0', 'R0', 'R0', "********************"]
    index = 0

    for instruction in instructionsListAux:

        if(len(instruction) > 1):

            if(instructionsListAux[index + 1] == "+"):
                break

        # Get name of instruction
        currentInstructionName = instruction[0]
        currentInstructionType = typeInstruction[currentInstructionName]

        # Obtain RD
        rDestiny = instruction[1]

        if(rDestiny != "R0"):

            # Next is instruction
            if(len(instructionsListAux[index + 1]) > 1):
                nextInstructionAux = instructionsListAux[index + 1]

            # Next is Label
            else:
                nextInstructionAux = instructionsListAux[index + 2]

        nextInstructionName = nextInstructionAux[0]

        nextInstructionType = typeInstruction[nextInstructionName]

        # Is Memory
        if(currentInstructionType == "01" and currentInstructionName == "LFM"):

            # Next is Control
            if(nextInstructionType == "00"):

                nextInstructionOpCode = opCode[nextInstructionName]

                # Conditional or Inconditional
                nextCondition = nextInstructionOpCode[0]

                # Conditional
                if(nextCondition == "1"):

                    nextFirstRegister = nextInstructionAux[1]
                    nextSecondRegister = nextInstructionAux[2]

                    if(rDestiny == nextFirstRegister or rDestiny == nextSecondRegister):

                        instructionsListAux.insert(index + 1, stall)
                        instructionsListAux.insert(index + 2, stall)
                        instructionsListAux.insert(index + 3, stall)

            # Next is Memory
            elif(nextInstructionType == "01"):

                nextInstructionOpCode = opCode[nextInstructionName]
                # Load or Store
                nextLoadorStore = nextInstructionOpCode[0]

                # Store
                if(nextLoadorStore == "0"):

                    nextSourceRegister = nextInstructionAux[1]
                    nextDestinyRegister = nextInstructionAux[3]

                    if(rDestiny == nextSourceRegister or rDestiny == nextDestinyRegister):

                        instructionsListAux.insert(index + 1, stall)
                        instructionsListAux.insert(index + 2, stall)
                        instructionsListAux.insert(index + 3, stall)

                # Load
                else:

                    nextSourceRegister = nextInstructionAux[3]

                    if(rDestiny == nextSourceRegister):

                        instructionsListAux.insert(index + 1, stall)
                        instructionsListAux.insert(index + 2, stall)
                        instructionsListAux.insert(index + 3, stall)
            
            # Next is Data






    return

testInstructions = getInstructions('test.txt')
print("Instructions: ", testInstructions)
testInstructions = riskManagement(testInstructions, typeInstruction, opCode)
print("Instructions Risk First: ", testInstructions)
