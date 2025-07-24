import sys

def main():
    row, col, width = sys.argv[1:4]
    # print(row, col, width)

    for x in range(1, int(row) + 1):
        # print(f"{x: >{width}}", end=" ")
        for y in range(1, int(col) + 1):
            print(f"{y * x: >{width}}", end=" ")
        print()

main()