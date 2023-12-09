const members = $$(".member");

const observer = new IntersectionObserver(
    (entries) => {
        entries.forEach((entry) => {
            entry.target.classList.toggle("show", entry.isIntersecting);
            if (entry.isIntersecting) observer.unobserve(entry.target);
        });
    },
    {
        threshold: 0,
        rootMargin: "-200px 0px",
    }
);

members.forEach((member) => {
    observer.observe(member);
})