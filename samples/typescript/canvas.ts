import { type Shape, area } from "./shapes";

const PRECISION = 2;
const HEX_COLOR = /^#[0-9a-f]{6}$/i;

/** Logs every call to the decorated method. */
function logged(_target: object, key: string, descriptor: PropertyDescriptor) {
  const original = descriptor.value;
  descriptor.value = function (this: unknown, ...args: unknown[]) {
    console.log(`${key}(${args.length} args)`);
    return original.apply(this, args);
  };
}

export class Canvas {
  private shapes: Shape[] = [];

  constructor(readonly background = "#000000") {
    if (!HEX_COLOR.test(background)) {
      throw new Error(`bad color: ${background}\n`);
    }
  }

  @logged
  add(shape: Shape): this {
    this.shapes.push(shape);
    return this;
  }

  // Total area, rounded for display.
  get coverage(): number {
    const total = this.shapes.reduce((sum, s) => sum + area(s), 0);
    return parseFloat(total.toFixed(PRECISION));
  }
}

const canvas = new Canvas().add({ kind: "circle", radius: 1.5 });
console.log(canvas.coverage > 7 ? "big" : "small", isNaN(canvas.coverage));
