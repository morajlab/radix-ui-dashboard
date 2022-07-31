import type { RadixUIDashComponent } from '@radix-ui-dashboard/types';
import type { HTMLAttributes } from 'react';

interface IButtonProps extends HTMLAttributes<HTMLButtonElement> {
  text: string;
}

export type ButtonComponent = RadixUIDashComponent<IButtonProps>;
