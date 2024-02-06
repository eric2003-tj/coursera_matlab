% Compute the Feigenbaum delta
% Store approximate values in the row vector delta for assessment, where length(delta)= num_doublings and 
% delta(2:num_doublings) are computed from the algorithm described in Lectures 21-23.
num_doublings=11; delta=zeros(1,num_doublings); delta(1)=5;
% Write your code here'
m_values = zeros(1,num_doublings+1);
m_values(1) = 2;
m_values(2) = 1+sqrt(5);
for n=2:num_doublings
    m_values(n+1) = m_values(n)+(m_values(n)-m_values(n-1))/delta(n-1);
    for m=1:20
        x = 1/2;
        x_p = 0;
        for k = 1:2^n
            x_p = x*(1-x)+m_values(n+1)*x_p*(1-2*x);
            x = m_values(n+1)*x*(1-x);
        end
        m_values(n+1) = m_values(n+1)-((x-0.5)/x_p);
    end
    delta(n) = (m_values(n)-m_values(n-1))/(m_values(n+1)-m_values(n));
end
