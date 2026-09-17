export type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "rect"; width: number; height: number };

export function area(shape: Shape): number {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "rect":
      return shape.width * shape.height;
  }
}
