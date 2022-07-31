import { styled } from '@radix-ui-dashboard/theme';
import styles from './button.styles';

import type { ButtonComponent } from './button.types';

export const Button: ButtonComponent = ({ text, ...rest }) => {
  const _Button = styled('button', styles);

  return <_Button {...rest}>{text}</_Button>;
};

export default Button;
