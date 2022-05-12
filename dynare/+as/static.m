function [residual, g1, g2, g3] = static(y, x, params)
    T = NaN(2, 1);
    if nargout <= 1
        residual = as.static_resid(T, y, x, params, true);
    elseif nargout == 2
        [residual, g1] = as.static_resid_g1(T, y, x, params, true);
    elseif nargout == 3
        [residual, g1, g2] = as.static_resid_g1_g2(T, y, x, params, true);
    else
        [residual, g1, g2, g3] = as.static_resid_g1_g2_g3(T, y, x, params, true);
    end
end
