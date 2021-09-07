#
# Copyright 2021, Andrew Lin.
#
# This software is licensed under the MIT License.
# See LICENSE.txt at the root of the project or
# https://opensource.org/licenses/MIT
#
module GenerateCatan
import Random
export generate_board, print_board

# Shuffle possible values, inserting a 0 at the desert location in `resources`.
function generate_values(resources)
    values = Random.shuffle(
        [
            "2",
            "3",  "3",
            "4",  "4",
            "5",  "5",
            "6",  "6",
            # 7 belongs to the robber.
            "8",  "8",
            "9",  "9",
            "10", "10",
            "11", "11",
            "12"
        ]
    )
    idx = findfirst(isequal("desert"), resources)
    return [values[1:idx - 1]; "0"; values[idx:end]]
end

# Generate a randomized Catan board.
function generate_board()
    function water() 
        return "water"
    end

    function harbor(idx)
        return "harbor(" * harbors[idx] * ")"
    end

    function resource(idx) 
        return resources[idx] * "(" * values[idx] * ")"
    end

    harbors = Random.shuffle(
        [
            "3:1", "3:1", "3:1", "3:1",
            "brick",
            "ore",
            "sheep",
            "wheat",
            "wood"
        ]
    )

    resources = Random.shuffle(
        [
            "brick", "brick", "brick",
            "desert",
            "ore",   "ore",   "ore",
            "sheep", "sheep", "sheep", "sheep",
            "wheat", "wheat", "wheat", "wheat",
            "wood",  "wood",  "wood",  "wood"
        ]
    )

    values = generate_values(resources)

    return [
        water(),   harbor(1),    water(),      harbor(2),
        harbor(3), resource(1),  resource(2),  resource(3),  water(),
        water(),   resource(4),  resource(5),  resource(6),  resource(7),  harbor(4),
        harbor(5), resource(8),  resource(9),  resource(10), resource(11), resource(12), water(),
        water(),   resource(13), resource(14), resource(15), resource(16), harbor(6),
        harbor(7), resource(17), resource(18), resource(19), water(),
        water(),   harbor(8),    water(),      harbor(9) 
    ]
end

# Print the generated Catan board.
function print_board(board)
    row_length = [1, 4, 5, 6, 7, 6, 5, 4]
    for row in 1:7
        idx_start = sum(row_length[1:row])
        idx_end = idx_start + row_length[row + 1] - 1
        print("row " * string(row) * ": | ")
        for idx in idx_start:idx_end
            print(board[idx] * " | ")
        end
        println()
    end
end

end