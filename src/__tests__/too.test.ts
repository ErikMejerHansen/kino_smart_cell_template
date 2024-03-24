import { foo } from "../foo";

describe('foo function', () => {
    it('returns a sensible number', () => {
        expect(foo()).toBe(42);
    });
});