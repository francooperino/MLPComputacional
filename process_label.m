function [p]= process_label(label)
    zero = zeros(7,1);
    index = grp2idx(label);
    zero(index) = 1;
p = zero;